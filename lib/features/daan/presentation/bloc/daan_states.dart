import 'package:equatable/equatable.dart';

abstract class DaanStates extends Equatable {
  const DaanStates();
  @override
  List<Object?> get props => [];
}

class DaanInitialState extends DaanStates {
  const DaanInitialState();
}

class DaanLoadingState extends DaanStates {
  const DaanLoadingState();
}

class DaanLoadedState extends DaanStates {
  const DaanLoadedState();
}

class DaanErrorState extends DaanStates {
  final String message;
  const DaanErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
