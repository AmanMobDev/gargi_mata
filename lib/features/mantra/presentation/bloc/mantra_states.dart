import 'package:equatable/equatable.dart';

import '../../data/model/request/mantra_response_model.dart';

class MantraStates extends Equatable {
  const MantraStates();
  @override
  List<Object> get props => [];
}

class GetMantraState extends MantraStates {
  const GetMantraState();
}

class MantraLoadingState extends MantraStates {
  const MantraLoadingState();
}

class MantraLoadedState extends MantraStates {
  final List<MantraResponseModel> mantra;
  const MantraLoadedState({required this.mantra});
  @override
  List<Object> get props => [mantra];
}

class MantraErrorState extends MantraStates {
  final String message;
  const MantraErrorState({required this.message});
}
