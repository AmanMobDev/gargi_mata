import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';

abstract class BhajanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AudioLoading extends BhajanState {}

class AudioLoaded extends BhajanState {
  final List<BhajanResponseModel> audioList;
  final bool isPlaying;
  AudioLoaded({required this.audioList, required this.isPlaying});

  @override
  List<Object?> get props => [audioList, isPlaying];
}

class AudioPlaying extends BhajanState {
  final String? url;
  final List<BhajanResponseModel>? audioList;
  final bool isPlaying;
  final Duration? position;
  final Duration? duration;
  AudioPlaying({
    required this.url,
    this.audioList,
    required this.isPlaying,
    this.position,
    this.duration,
  });

  @override
  List<Object?> get props => [url, audioList, isPlaying, position, duration];
}

class AudioPaused extends BhajanState {
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

class AudioStopped extends BhajanState {
  final List<BhajanResponseModel> audioList;
  final bool isPlaying;
  AudioStopped({required this.audioList, required this.isPlaying});

  @override
  List<Object?> get props => [audioList, isPlaying];
}

class AudioError extends BhajanState {
  final String message;
  AudioError(this.message);

  @override
  List<Object?> get props => [message];
}
