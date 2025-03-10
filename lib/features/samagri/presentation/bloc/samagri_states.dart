import 'package:equatable/equatable.dart';
import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
abstract class SamagriStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class SamagriInitialState extends SamagriStates {}

class SamagriLoadingState extends SamagriStates {}

class SamagriLoadedState extends SamagriStates {
  final List<SamagriResponseModel> samagriResponseModels;

  SamagriLoadedState({required this.samagriResponseModels});

  @override
  List<Object?> get props => [samagriResponseModels];
}

class SamagriErrorState extends SamagriStates {
  final String message;
  SamagriErrorState({required this.message});
}
