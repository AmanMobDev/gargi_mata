import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';

abstract class AudioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AudioLoading extends AudioState {}

class AudioLoaded extends AudioState {
  final List<BhajanResponseModel> audioList;
  final bool isPlaying;
  AudioLoaded({required this.audioList, required this.isPlaying});

  @override
  List<Object?> get props => [audioList, isPlaying];
}

class AudioPlaying extends AudioState {
  final String url;
  final List<BhajanResponseModel> audioList;
  final bool isPlaying;
  AudioPlaying({
    required this.url,
    required this.audioList,
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [url, audioList, isPlaying];
}

class AudioPaused extends AudioState {
  final String url;
  final List<BhajanResponseModel> audioList;
  final bool isPlaying;
  AudioPaused({
    required this.url,
    required this.audioList,
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [url, audioList, isPlaying];
}

class AudioStopped extends AudioState {
  final List<BhajanResponseModel> audioList;
  final bool isPlaying;
  AudioStopped({required this.audioList, required this.isPlaying});

  @override
  List<Object?> get props => [audioList, isPlaying];
}

class AudioError extends AudioState {
  final String message;
  AudioError(this.message);

  @override
  List<Object?> get props => [message];
}
