import 'package:just_audio/just_audio.dart';

import '../../../../config/exports/app_export.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentUrl;

  AudioPlayerBloc() : super(AudioStoppedState()) {
    on<TogglePlayPauseEvent>((event, emit) async {
      if (state is AudioPlayingState &&
          (state as AudioPlayingState).currentUrl == event.url) {
        debugPrint("Pausing Audio: ${event.url}");
        _audioPlayer.pause();
        emit(AudioPausedState(event.url));
      } else {
        await _audioPlayer.setUrl(event.url);
        await _audioPlayer.play();
        _currentUrl = event.url;
        emit(AudioPlayingState(_currentUrl!));
      }
    });
  }
}

// Events
abstract class AudioPlayerEvent {}

class TogglePlayPauseEvent extends AudioPlayerEvent {
  final String url;
  TogglePlayPauseEvent(this.url);
}

class SeekAudioEvent extends AudioPlayerEvent {
  final Duration position;
  SeekAudioEvent(this.position);
}

// States
abstract class AudioPlayerState {}

class AudioStoppedState extends AudioPlayerState {}

class AudioPlayingState extends AudioPlayerState {
  final String currentUrl;
  AudioPlayingState(this.currentUrl);
}

class AudioPausedState extends AudioPlayerState {
  final String currentUrl;
  AudioPausedState(this.currentUrl);
}
