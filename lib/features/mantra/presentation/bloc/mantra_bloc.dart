import 'package:gargi_mata/features/mantra/data/model/request/mantra_response_model.dart';
import 'package:gargi_mata/features/mantra/presentation/bloc/mantra_events.dart';
import 'package:gargi_mata/features/mantra/presentation/bloc/mantra_states.dart';

import '../../../../config/exports/app_export.dart';
import '../../domain/usecase/mantra_use_case.dart';

class MantraBloc extends Bloc<MantraEvents, MantraStates> {
  final GetMantraUseCase getMantraUseCase;
  StreamSubscription<List<MantraResponseModel>>? _streamSubscription;

  MantraBloc({required this.getMantraUseCase}) : super(const GetMantraState()) {
    on<GetMantraEvent>((event, emit) async {
      emit(const MantraLoadingState());
      await _streamSubscription?.cancel();
      try {
        _streamSubscription = getMantraUseCase().listen(
          (mantra) {
            if (!emit.isDone) {
              emit(MantraLoadedState(mantra: mantra));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(MantraErrorState(message: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(MantraErrorState(message: e.toString()));
        }
      }
    });
  }
}
