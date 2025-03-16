import 'package:gargi_mata/features/history/data/model/response/history_response_model.dart';
import 'package:gargi_mata/features/history/domain/usecase/history_use_case.dart';
import 'package:gargi_mata/features/history/presentation/bloc/history_event.dart';
import 'package:gargi_mata/features/history/presentation/bloc/history_state.dart';

import '../../../../config/exports/app_export.dart';

class HistoryBloc extends Bloc<HistoryEvents, HistoryStates> {
  final GetHistoryUseCase getHistoryDataUseCase;
  StreamSubscription<List<HistoryResponseModel>>? _historyDataSubscription;

  HistoryBloc({required this.getHistoryDataUseCase})
    : super(const HistoryInitial()) {
    on<GetHistoryEvent>((event, emit) async {
      emit(const HistoryLoading());
      await _historyDataSubscription?.cancel();

      try {
        _historyDataSubscription = getHistoryDataUseCase().listen(
          (historyData) {
            if (!emit.isDone) {
              emit(HistoryLoaded(historyDataList: historyData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(HistoryError(errorMessage: error.toString()));
            }
          },
        );
      } catch (e) {
        emit(HistoryError(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _historyDataSubscription
        ?.cancel(); // Cancel the subscription to avoid memory leaks
    return super.close();
  }
}
