import 'package:equatable/equatable.dart';
import 'package:gargi_mata/features/history/data/model/response/history_response_model.dart';

abstract class HistoryStates extends Equatable {
  const HistoryStates();
  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryStates {
  const HistoryInitial();
}

class HistoryLoading extends HistoryStates {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryStates {
  final List<HistoryResponseModel> historyDataList;
  const HistoryLoaded({required this.historyDataList});

  @override
  List<Object> get props => [historyDataList];
}

class HistoryError extends HistoryStates {
  final String errorMessage;
  const HistoryError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
