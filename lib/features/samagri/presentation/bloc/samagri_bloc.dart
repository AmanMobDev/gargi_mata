import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';
import 'package:gargi_mata/features/samagri/domain/usecase/samagri_use_case.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_event.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_states.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class SamagriBloc extends Bloc<SamagriEvents, SamagriStates> {
  final SamagriUseCase samagriUseCase;
  StreamSubscription<List<SamagriResponseModel>>? _subscription;
  SamagriBloc({required this.samagriUseCase}) : super(SamagriInitialState()) {
    on<GetSamagriEvent>((event, emit) async {
      emit(SamagriLoadingState());
      await _subscription?.cancel();

      try {
        _subscription = samagriUseCase().listen(
          (samagriData) {
            if (!emit.isDone) {
              emit(SamagriLoadedState(samagriResponseModels: samagriData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(SamagriErrorState(message: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(SamagriErrorState(message: e.toString()));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
