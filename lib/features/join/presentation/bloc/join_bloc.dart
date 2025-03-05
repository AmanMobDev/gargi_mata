import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class JoinBloc extends Bloc<JoinEvent, JoinStates> {
  final JoinDataUseCase? joinDataUseCase;

  JoinBloc({required this.joinDataUseCase}) : super(JoinInitialState()) {
    on<JoinEvent>(_getJoinData);
  }

  Future<void> _getJoinData(JoinEvent event, Emitter<JoinStates> emit) async {
    try {
      emit(JoinLoadingState());
      final result = await joinDataUseCase!.execute();
      emit(JoinLoadedState(joinResponseModels: result));
    } catch (e) {
      emit(JoinErrorState(message: e.toString()));
    }
  }
}
