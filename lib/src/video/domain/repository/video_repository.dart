
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/video.dart';


abstract class VideoRepository {
  // API methods
  Future<Either<Failure, List<VideoModel>>> getAllVideos();

  // Database methods
  Future <Either<Failure, List<VideoModel>>> getSavedArticles();

}