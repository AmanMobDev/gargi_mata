import 'package:equatable/equatable.dart';
import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class LoadMusic extends MusicEvent {
  final String url;

  LoadMusic({required this.url});

  @override
  List<Object> get props => [url];
}

class PlayPauseMusic extends MusicEvent {
  final BhajanResponseModel music;

  PlayPauseMusic({required this.music});

  @override
  List<Object> get props => [music];
}

class SeekMusic extends MusicEvent {
  final Duration position;
  final BhajanResponseModel music;

  SeekMusic({required this.position, required this.music});

  @override
  List<Object> get props => [position, music];
}

class DisposeMusic extends MusicEvent {}

class UpdatePlaybackState extends MusicEvent {
  final Duration position;
  final Duration duration;

  UpdatePlaybackState({required this.position, required this.duration});

  @override
  List<Object> get props => [position, duration];
}
