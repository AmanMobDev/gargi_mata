import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class JoinBloc extends Bloc<JoinEvent, JoinStates> {
  final GetJoinDataUseCase getJoinDataUseCase;
  StreamSubscription<List<JoinResponseModel>>? _subscription;

  JoinBloc({required this.getJoinDataUseCase}) : super(JoinInitialState()) {
    on<GetJoinEvent>((event, emit) async {
      emit(JoinLoadingState());

      await _subscription?.cancel();

      try {
        _subscription = getJoinDataUseCase().listen(
          (joinData) {
            if (!emit.isDone) {
              emit(JoinLoadedState(joinResponseModels: joinData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(JoinErrorState(message: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(JoinErrorState(message: e.toString()));
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
