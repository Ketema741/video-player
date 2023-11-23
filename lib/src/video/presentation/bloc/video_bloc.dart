import 'package:bloc/bloc.dart';
import '../../data/models/video.dart';
import '../../domain/usecase/get_all_video.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetAllVideosUseCase getAllVideosUseCase;

  VideoBloc({required this.getAllVideosUseCase}) : super(VideoInitialState()) {
    on<FetchAllVideosEvent>(_onFetchAllVideos);
  }

  void _onFetchAllVideos(
      FetchAllVideosEvent event, Emitter<VideoState> emit) async {
    emit(VideoLoading());
    try {
      final result = await getAllVideosUseCase.execute();
      result.fold(
          (failure) => emit(VideoErrorState("" )),
          (List<VideoModel> res) {
            emit(VideoLoadedState(
              res
            ));
          },
        );
    } catch (e) {
      emit(VideoErrorState('Failed to fetch all videos'));
    }
  }
}
