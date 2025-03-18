import '../../../../../config/exports/app_export.dart';

abstract class BhajanEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAudioList extends BhajanEvent {}

class PlayAudio extends BhajanEvent {
  final String url;
  final bool isPlaying;
  PlayAudio({required this.url, required this.isPlaying});

  @override
  List<Object?> get props => [url, isPlaying];
}

class PauseAudio extends BhajanEvent {
  final String url;
  final bool isPlaying;
  PauseAudio({required this.url, required this.isPlaying});

  @override
  List<Object?> get props => [url, isPlaying];
}

class StopAudio extends BhajanEvent {
  final bool isPlaying;
  StopAudio({required this.isPlaying});
}

class SeekAudio extends BhajanEvent {
  final Duration position;
  SeekAudio(this.position);
  @override
  List<Object?> get props => [position];
}
