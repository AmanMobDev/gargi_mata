import '../../../../../config/exports/app_export.dart';
import '../../../data/model/bhajan_response_model.dart';

abstract class BhajanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AudioLoading extends BhajanState {}

class AudioLoaded extends BhajanState {
  final List<BhajanResponseModel> audioList;
  AudioLoaded({required this.audioList});

  @override
  List<Object?> get props => [audioList];
}

class AudioPlaying extends BhajanState {
  final List<BhajanResponseModel>? audioList;

  AudioPlaying({this.audioList});

  @override
  List<Object?> get props => [audioList];
}

class AudioPaused extends BhajanState {
  final List<BhajanResponseModel> audioList;
  AudioPaused({required this.audioList});

  @override
  List<Object?> get props => [audioList];
}

class AudioStopped extends BhajanState {
  final List<BhajanResponseModel> audioList;
  AudioStopped({required this.audioList});

  @override
  List<Object?> get props => [audioList];
}

class AudioError extends BhajanState {
  final String message;
  AudioError(this.message);

  @override
  List<Object?> get props => [message];
}
