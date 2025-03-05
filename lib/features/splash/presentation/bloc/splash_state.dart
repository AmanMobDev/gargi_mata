import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashLoadedState extends SplashState {
  const SplashLoadedState();

  @override
  List<Object?> get props => [];
}

class SplashErrorState extends SplashState {
  final String message;
  const SplashErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
