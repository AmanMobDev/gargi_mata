import 'package:equatable/equatable.dart';

import '../../data/model/bhajan_response_model.dart';

abstract class BhajanStates extends Equatable {
  const BhajanStates();
  @override
  List<Object> get props => [];
}

class BhajanInitialState extends BhajanStates {}

class BhajanLoadingState extends BhajanStates {
  const BhajanLoadingState();
}

class BhajanLoadedState extends BhajanStates {
  final List<BhajanResponseModel> bhajanList;
  const BhajanLoadedState({required this.bhajanList});
  @override
  List<Object> get props => [bhajanList];
}

class BhajanErrorState extends BhajanStates {
  final String message;
  const BhajanErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
