import 'package:gargi_mata/config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SplashInitialEvent extends SplashEvent {}
