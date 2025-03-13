import 'package:equatable/equatable.dart';

abstract class MantraEvents extends Equatable {
  const MantraEvents();
  @override
  List<Object> get props => [];
}

class GetMantraEvent extends MantraEvents {}
