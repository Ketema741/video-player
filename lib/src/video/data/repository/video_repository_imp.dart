import 'package:dartz/dartz.dart';
import 'package:flutter_video_player_yt/core/error/exceptions.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/video_repository.dart';
import '../data_sources/local/local_data_sources.dart';
import '../data_sources/remote/remote_data_sources.dart';
import '../models/video.dart';

class VideoRepositoryImpl implements VideoRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  VideoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<VideoModel>>> getAllVideos() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.fetchData();
        // cache data on sharedprevernces
        localDataSource.cacheData(remoteData);
        final videoList = (remoteData['videos'] as List<dynamic>)
            .map((json) => VideoModel.fromJson(json))
            .toList();

        final appBackgroundHexColor = remoteData["appBackgroundHexColor"];
        localDataSource.cacheColor(appBackgroundHexColor);

        return Right(videoList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // local datasource
      try {
        final localeData = await localDataSource.getCachedData();
        final videoList = (localeData["videos"] as List<dynamic>)
            .map((json) => VideoModel.fromJson(json))
            .toList();
        return Right(videoList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<VideoModel>>> getSavedArticles() {
    throw UnimplementedError();
  }
}
