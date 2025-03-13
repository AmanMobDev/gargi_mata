import 'package:equatable/equatable.dart';

import '../../data/model/response/home_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class HomeStates extends Equatable {
  const HomeStates();
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeStates {
  const HomeInitialState();
}

class HomeLoading extends HomeStates {
  const HomeLoading();
}

class HomeLoaded extends HomeStates {
  final List<HomeResponseModel> homeResponseModel;
  const HomeLoaded({required this.homeResponseModel});
  @override
  List<Object?> get props => [homeResponseModel];
}

class HomeError extends HomeStates {
  final String error;

  const HomeError(this.error);

  @override
  List<Object?> get props => [error];
}
