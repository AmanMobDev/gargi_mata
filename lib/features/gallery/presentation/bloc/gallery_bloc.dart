import 'package:gargi_mata/features/gallery/data/model/response/gallery_response_model.dart';
import 'package:gargi_mata/features/gallery/domain/usecase/gallery_use_case.dart';
import 'package:gargi_mata/features/gallery/presentation/bloc/gallery_event.dart';
import 'package:gargi_mata/features/gallery/presentation/bloc/gallery_state.dart';

import '../../../../config/exports/app_export.dart';

class GalleryBloc extends Bloc<GalleryEvents, GalleryStates> {
  final GetGalleryUseCase getGalleryUseCase;
  StreamSubscription<List<GalleryResponseModel>>? _subscription;

  GalleryBloc({required this.getGalleryUseCase}) : super(GalleryInitial()) {
    on<GetGalleryEvents>((event, emit) async {
      emit(GalleryLoading());

      await _subscription?.cancel();

      try {
        _subscription = getGalleryUseCase().listen(
          (galleryData) {
            if (!emit.isDone) {
              emit(GalleryLoaded(galleryResponseModel: galleryData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(GalleryError(error.toString()));
            }
          },
        );
      } catch (e) {
        emit(GalleryError(e.toString()));
      }
    });
  }
}
