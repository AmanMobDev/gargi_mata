import 'package:equatable/equatable.dart';

abstract class HistoryEvents extends Equatable {
  const HistoryEvents();
  @override
  List<Object> get props => [];
}

class GetHistoryEvent extends HistoryEvents {
  const GetHistoryEvent();
  @override
  List<Object> get props => [];
}
