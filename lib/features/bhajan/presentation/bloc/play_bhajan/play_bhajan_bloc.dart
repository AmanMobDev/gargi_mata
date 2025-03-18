import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';
import 'package:just_audio/just_audio.dart';

import 'play_bhajan_event.dart';
import 'play_bhajan_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final AudioPlayer audioPlayer = AudioPlayer(); // Initialize AudioPlayer here
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration?>?
  _durationSubscription; // Allow nullable Duration
  BhajanResponseModel? currentMusic;

  MusicBloc() : super(MusicInitial()) {
    on<LoadMusic>((event, emit) async {
      emit(MusicLoading());

      // Cancel any existing subscriptions
      await _positionSubscription?.cancel();
      await _durationSubscription?.cancel();

      try {
        final music = currentMusic;

        await audioPlayer.setUrl(music!.url); // Load the audio URL
        emit(MusicLoaded(music: music, duration: duration, position: position));

        // Listen to position stream
        _positionSubscription = audioPlayer.positionStream.listen((pos) {
          add(
            UpdatePlaybackState(position: pos, duration: duration),
          ); // Add event instead of emitting
        });

        // Listen to duration stream
        _durationSubscription = audioPlayer.durationStream.listen((dur) {
          duration = dur ?? Duration.zero; // Handle nullable duration
          add(
            UpdatePlaybackState(position: position, duration: duration),
          ); // Add event instead of emitting
        });
      } catch (e) {
        emit(MusicError(message: e.toString()));
        print(e);
      }
    });

    on<PlayPauseMusic>((event, emit) async {
      if (audioPlayer.playing) {
        await audioPlayer.pause();
      } else {
        try {
          await audioPlayer.play();
        } catch (e) {
          emit(MusicError(message: e.toString()));
        }
      }
      emit(
        MusicLoaded(music: event.music, duration: duration, position: position),
      ); // Emit updated state
    });

    on<SeekMusic>((event, emit) async {
      await audioPlayer.seek(event.position);
      emit(
        MusicLoaded(
          music: event.music,
          duration: duration,
          position: event.position,
        ),
      ); // Emit updated state
    });

    on<UpdatePlaybackState>((event, emit) {
      position = event.position;
      duration = event.duration;
      if (currentMusic != null) {
        emit(
          MusicLoaded(
            music: currentMusic!,
            duration: duration,
            position: position,
          ),
        );
      }
    });

    on<DisposeMusic>((event, emit) async {
      await audioPlayer.dispose();
      await _positionSubscription?.cancel();
      await _durationSubscription?.cancel();
      emit(MusicInitial());
    });
  }

  @override
  Future<void> close() async {
    await audioPlayer.dispose();
    await _positionSubscription?.cancel();
    await _durationSubscription?.cancel();
    return super.close();
  }
}
