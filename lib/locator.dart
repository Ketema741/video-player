import 'package:flutter/foundation.dart';
import 'package:flutter_video_player_yt/src/video/data/data_sources/remote/remote_data_sources.dart';
import 'package:flutter_video_player_yt/src/video/data/repository/video_repository_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'src/video/data/data_sources/local/local_data_sources.dart';
import 'src/video/domain/repository/video_repository.dart';
import 'src/video/domain/usecase/get_all_video.dart';
import 'src/video/presentation/bloc/video_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setupLocator() async {
  try {
    // Register your BLoCs
    sl.registerFactory(() => VideoBloc(getAllVideosUseCase: sl()));

    // Register usecase here
    sl.registerLazySingleton(() => GetAllVideosUseCase(repository: sl()));

    // Register Data Source
    sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: sl()));

    sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImp(sharedPreferences: sl()));

    // Register Repositories
    sl.registerLazySingleton<VideoRepository>(
      () => VideoRepositoryImpl(
          remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()),
    );

    ///***********************************************
    ///! Core
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

    // Externalls
    final sharedPreferences = await SharedPreferences.getInstance();

    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => InternetConnectionChecker());
    debugPrint('Dependency injection successful!!');
  } catch (e) {
    debugPrint('Error during dependency injection setup: $e');
  }
}
