import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/video.dart';
import '../repository/video_repository.dart';

class GetAllVideosUseCase {
  final VideoRepository repository;

  GetAllVideosUseCase({required this.repository});

  Future<Either<Failure, List<VideoModel>>> execute() async {
      return await repository.getAllVideos();
  }
  
}
