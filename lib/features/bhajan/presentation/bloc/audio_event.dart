import '../../../../config/exports/app_export.dart';

abstract class AudioEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAudioList extends AudioEvent {}

class PlayAudio extends AudioEvent {
  final String url;
  final bool isPlaying;
  PlayAudio({required this.url, required this.isPlaying});

  @override
  List<Object?> get props => [url, isPlaying];
}

class PauseAudio extends AudioEvent {
  final String url;
  final bool isPlaying;
  PauseAudio({required this.url, required this.isPlaying});

  @override
  List<Object?> get props => [url, isPlaying];
}

class StopAudio extends AudioEvent {
  // final String url;
  final bool isPlaying;
  StopAudio({required this.isPlaying});
}

class SeekAudio extends AudioEvent {
  final Duration position;
  SeekAudio(this.position);
}
