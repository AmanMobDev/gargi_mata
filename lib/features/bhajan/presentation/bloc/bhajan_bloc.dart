import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';
import 'package:gargi_mata/features/bhajan/domain/usecase/bhajan_use_case.dart';
import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_events.dart';
import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_states.dart';

import '../../../../config/exports/app_export.dart';

class BhajanBloc extends Bloc<BhajanEvents, BhajanStates> {
  final GetBhajanUseCase getBhajanUseCase;
  StreamSubscription<List<BhajanResponseModel>>? _subscription;

  BhajanBloc({required this.getBhajanUseCase}) : super(BhajanInitialState()) {
    on<GetBhajanInitialEvent>((event, emit) async {
      emit(BhajanLoadingState());
      await _subscription?.cancel();
      try {
        _subscription = getBhajanUseCase().listen(
          (bhajanData) {
            if (!emit.isDone) {
              Logger.log(bhajanData.toString());
              emit(BhajanLoadedState(bhajanList: bhajanData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(BhajanErrorState(message: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(BhajanErrorState(message: e.toString()));
        }
      }
    });
  }
}
