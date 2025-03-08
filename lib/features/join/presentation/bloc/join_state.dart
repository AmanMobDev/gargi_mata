import '../../../../config/exports/app_export.dart';

abstract class JoinStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class JoinInitialState extends JoinStates {}

class JoinLoadingState extends JoinStates {}

class JoinLoadedState extends JoinStates {
  final List<JoinResponseModel> joinResponseModels;

  JoinLoadedState({required this.joinResponseModels});

  @override
  List<Object?> get props => [joinResponseModels];
}

class JoinErrorState extends JoinStates {
  final String message;
  JoinErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
