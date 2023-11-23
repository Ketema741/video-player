import 'package:equatable/equatable.dart';


class VideoEntity extends Equatable{
  final String videoTitle;
  final String videoThumbnail;
  final String videoUrl;
  final String videoDescription;

  const VideoEntity({
    required this.videoTitle,
    required this.videoThumbnail,
    required this.videoUrl,
    required this.videoDescription,
  });
  
  @override
  List<Object?> get props => [videoUrl];
}