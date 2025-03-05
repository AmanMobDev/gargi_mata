import '../../../../config/exports/app_export.dart';

abstract class JoinStates extends Equatable {
  const JoinStates();

  @override
  List<Object?> get props => [];
}

class JoinInitialState extends JoinStates {}

class JoinLoadingState extends JoinStates {}

class JoinLoadedState extends JoinStates {
  final List<JoinResponseModel> joinResponseModels;

  const JoinLoadedState({required this.joinResponseModels});

  @override
  // TODO: implement props
  List<Object?> get props => [joinResponseModels];
}

class JoinErrorState extends JoinStates {
  final String message;
  const JoinErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
