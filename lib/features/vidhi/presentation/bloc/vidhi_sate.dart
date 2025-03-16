import 'package:equatable/equatable.dart';
import 'package:gargi_mata/features/vidhi/data/model/response/vidhi_response_model.dart';

class VidhiStates extends Equatable {
  const VidhiStates();
  @override
  List<Object?> get props => [];
}

class VidhiInitialState extends VidhiStates {}

class VidhiLoadingState extends VidhiStates {}

class VidhiLoadedState extends VidhiStates {
  final List<VidhiResponseModel> vidhiList;
  const VidhiLoadedState({required this.vidhiList});
  @override
  List<Object?> get props => [vidhiList];
}

class VidhiError extends VidhiStates {
  final String errorMessage;
  const VidhiError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
