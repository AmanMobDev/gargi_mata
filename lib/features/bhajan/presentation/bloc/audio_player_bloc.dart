import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/model/bhajan_response_model.dart';
import '../../domain/usecase/bhajan_use_case.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final GetBhajanUseCase fetchAudioListUseCase;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  List<BhajanResponseModel> _audioList = [];

  AudioBloc({required this.fetchAudioListUseCase}) : super(AudioLoading()) {
    on<LoadAudioList>(_onLoadAudioList);
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
    on<StopAudio>(_onStopAudio);
    // on<SeekAudio>(_onSeekAudio);
  }

  // ✅ Load the audio list from Firestore
  Future<void> _onLoadAudioList(
    LoadAudioList event,
    Emitter<AudioState> emit,
  ) async {
    emit(AudioLoading());
    try {
      isPlaying = false;
      final audioList = await fetchAudioListUseCase();
      _audioList = audioList;
      emit(AudioLoaded(audioList: audioList, isPlaying: false));
    } catch (e) {
      emit(AudioError("Failed to load audio"));
    }
  }

  // ✅ Play the selected audio
  Future<void> _onPlayAudio(PlayAudio event, Emitter<AudioState> emit) async {
    try {
      isPlaying = true;
      await _audioPlayer.setUrl(event.url);
      await _audioPlayer.play();
      emit(
        AudioPlaying(audioList: _audioList, isPlaying: true, url: event.url),
      );
    } catch (e) {
      emit(AudioError("Error playing audio"));
    }
  }

  // ✅ Pause the current audio
  Future<void> _onPauseAudio(PauseAudio event, Emitter<AudioState> emit) async {
    if (isPlaying) {
      isPlaying = false;
      await _audioPlayer.pause();
      emit(
        AudioPaused(audioList: _audioList, isPlaying: false, url: event.url),
      );
    }
  }

  // ✅ Stop the current audio
  Future<void> _onStopAudio(StopAudio event, Emitter<AudioState> emit) async {
    if (isPlaying) {
      isPlaying = false;
      await _audioPlayer.stop();
      emit(AudioLoaded(isPlaying: false, audioList: _audioList));
    }
  }

  Future<void> _onSeekAudio(PlayAudio event, Emitter<AudioState> emit) async {
    try {
      isPlaying = true;
      //  await _audioPlayer.seek(event.position);
      emit(
        AudioPlaying(
          audioList: _audioList,
          isPlaying: true,
          url: event.url,
          //position: event.position,
          //duration: _audioPlayer.duration ?? Duration.zero,
        ),
      );
    } catch (e) {
      emit(AudioError("Error playing audio"));
    }
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
