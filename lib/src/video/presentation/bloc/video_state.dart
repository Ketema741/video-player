part of 'video_bloc.dart';
abstract class VideoState {}

class VideoInitialState extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoadedState extends VideoState {
  final List<VideoModel> videos;

  VideoLoadedState(this.videos);
}

class VideoErrorState extends VideoState {
  final String errorMessage;

  VideoErrorState(this.errorMessage);
}

