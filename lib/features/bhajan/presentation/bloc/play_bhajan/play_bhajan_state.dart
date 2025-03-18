import 'package:equatable/equatable.dart';
import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final BhajanResponseModel music;
  final Duration duration;
  final Duration position;

  const MusicLoaded({
    required this.music,
    required this.duration,
    required this.position,
  });

  @override
  List<Object> get props => [music, duration, position];
}

class MusicError extends MusicState {
  final String message;

  const MusicError({required this.message});

  @override
  List<Object> get props => [message];
}
