import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/vidhi/data/model/response/vidhi_response_model.dart';
import 'package:gargi_mata/features/vidhi/domain/usecase/vidhi_use_case.dart';
import 'package:gargi_mata/features/vidhi/presentation/bloc/vidhi_event.dart';
import 'package:gargi_mata/features/vidhi/presentation/bloc/vidhi_sate.dart';

class VidhiBloc extends Bloc<VidhiEvents, VidhiStates> {
  final GetVidhiUseCase getVidhiUseCase;
  StreamSubscription<List<VidhiResponseModel>>? _vidhiSubscription;

  VidhiBloc({required this.getVidhiUseCase}) : super(VidhiInitialState()) {
    on<GetVidhiEvent>((event, emit) async {
      emit(VidhiLoadingState());
      _vidhiSubscription?.cancel();

      try {
        _vidhiSubscription = getVidhiUseCase().listen(
          (vidhiList) {
            if (!emit.isDone) {
              emit(VidhiLoadedState(vidhiList: vidhiList));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(VidhiError(errorMessage: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(VidhiError(errorMessage: e.toString()));
        }
      }
    });
  }
}
