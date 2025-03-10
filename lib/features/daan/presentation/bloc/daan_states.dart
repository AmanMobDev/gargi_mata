import 'package:gargi_mata/config/exports/app_export.dart';

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

class DaanDataLoadedState extends DaanStates {
  final List<DaanResponseModel> daanResponseModel;

  DaanDataLoadedState({required this.daanResponseModel});

  @override
  List<Object?> get props => [daanResponseModel];
}

class DaanErrorState extends DaanStates {
  final String message;
  const DaanErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
