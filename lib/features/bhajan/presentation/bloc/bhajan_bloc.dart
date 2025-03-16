import 'package:just_audio/just_audio.dart';

import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';
import '../../domain/usecase/bhajan_use_case.dart';
import 'bhajan_event.dart';
import 'bhajan_state.dart';

class BhajanBloc extends Bloc<BhajanEvent, BhajanState> {
  final GetBhajanUseCase fetchAudioListUseCase;
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  List<BhajanResponseModel> _audioList = [];
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  StreamSubscription<Duration>? _positionSubscription;

  BhajanBloc({required this.fetchAudioListUseCase}) : super(AudioLoading()) {
    on<LoadAudioList>(_onLoadAudioList);
    on<PlayAudio>(_onPlayAudio);
    on<SeekAudio>(_onSeekAudio);
    on<PauseAudio>(_onPauseAudio);
    on<StopAudio>(_onStopAudio);
  }

  // ✅ Load the audio list from Firestore
  Future<void> _onLoadAudioList(
    LoadAudioList event,
    Emitter<BhajanState> emit,
  ) async {
    emit(AudioLoading());
    try {
      //isPlaying = true;
      final audioList = await fetchAudioListUseCase();
      _audioList = audioList;
      emit(AudioLoaded(audioList: audioList, isPlaying: isPlaying));
    } catch (e) {
      emit(AudioError("Failed to load audio"));
    }
  }

  // ✅ Play the selected audio
  Future<void> _onPlayAudio(event, emit) async {
    try {
      isPlaying = true;
      await audioPlayer.setUrl(event.url);
      await audioPlayer.play();
      // audioPlayer.durationStream.listen((duration) {
      //   _duration = duration ?? Duration.zero;
      //   debugPrint(
      //     "durationStream::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$_duration",
      //   );
      // });
      // audioPlayer.positionStream.listen((position) {
      //   _position = position;
      //   if (state is AudioPlaying) {
      //     add(SeekAudio(position)); // Dispatching event to handle state update
      //   }
      //   debugPrint(
      //     "positionStream::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$_position",
      //   );
      // });
      emit(
        AudioPlaying(
          url: event.url,
          isPlaying: isPlaying,
          duration: audioPlayer.duration ?? Duration.zero,
          position: audioPlayer.position,
        ),
      );
    } catch (e) {
      emit(AudioError("Failed to play audio"));
    }
  }

  // ✅ Pause the current audio
  Future<void> _onPauseAudio(
    PauseAudio event,
    Emitter<BhajanState> emit,
  ) async {
    if (isPlaying) {
      isPlaying = false;
      await audioPlayer.pause();
      emit(
        AudioPaused(
          audioList: _audioList,
          isPlaying: isPlaying,
          url: event.url,
        ),
      );
    }
  }

  Future<void> _onStopAudio(StopAudio event, Emitter<BhajanState> emit) async {
    if (isPlaying) {
      isPlaying = false;
      await audioPlayer.stop();
      _position = Duration.zero; // Reset position
      emit(AudioLoaded(isPlaying: isPlaying, audioList: _audioList));
    }
  }

  Future<void> _onSeekAudio(SeekAudio event, Emitter<BhajanState> emit) async {
    await audioPlayer.seek(event.position);
    if (state is AudioPlaying) {
      emit(
        AudioPlaying(
          url: (state as AudioPlaying).url,
          isPlaying: true,
          duration: (state as AudioPlaying).duration,
          position: event.position,
        ),
      );
    }
  }

  String formatDuration(Duration duration) {
    debugPrint(
      "duration::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$duration",
    );
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    debugPrint(
      "minutes::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$minutes",
    );
    debugPrint(
      "seconds::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$seconds",
    );
    return "$minutes:$seconds";
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
