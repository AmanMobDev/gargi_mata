import 'dart:math';

import '../../../../config/exports/app_export.dart';
import '../bloc/play_bhajan/play_bhajan_bloc.dart';
import '../bloc/play_bhajan/play_bhajan_event.dart';
import '../bloc/play_bhajan/play_bhajan_state.dart';

Widget buildMusicPlayer(MusicLoaded state, BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 15.0,
      children: [
        TextWidget(value: state.music.fileName, fontSize: 20.0),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_formatDuration(state.position)),
              SizedBox(width: 10),
              Expanded(
                child: Slider(
                  activeColor: AppColor.backgroundColor,
                  min: 0,
                  max: state.duration.inSeconds.toDouble(),
                  value: min(
                    state.position.inSeconds.toDouble(),
                    state.duration.inSeconds.toDouble(),
                  ),
                  onChanged: (value) {
                    final position = Duration(seconds: value.toInt());
                    BlocProvider.of<MusicBloc>(
                      context,
                    ).add(SeekMusic(position: position, music: state.music));
                  },
                ),
              ),
              SizedBox(width: 10),
              Text(_formatDuration(state.duration)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<MusicBloc>(
              context,
            ).add(PlayPauseMusic(music: state.music));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            margin: EdgeInsets.all(10.0),
            elevation: 5.0,
            color: AppColor.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                BlocProvider.of<MusicBloc>(context).audioPlayer.playing
                    ? Icons.pause
                    : Icons.play_arrow_rounded,
                color: AppColor.backgroundColor,
                size: 48.0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
