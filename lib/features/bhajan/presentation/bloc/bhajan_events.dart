import 'package:equatable/equatable.dart';

abstract class BhajanEvents extends Equatable {
  const BhajanEvents();
  @override
  List<Object> get props => [];
}

class GetBhajanInitialEvent extends BhajanEvents {
  const GetBhajanInitialEvent();
}
