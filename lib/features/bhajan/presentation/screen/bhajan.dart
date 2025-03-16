import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';
import '../bloc/bhajan_bloc.dart';
import '../bloc/bhajan_event.dart';
import '../bloc/bhajan_state.dart';

class BhajanScreen extends StatefulWidget {
  const BhajanScreen({super.key});

  @override
  State<BhajanScreen> createState() => _BhajanScreenState();
}

class _BhajanScreenState extends State<BhajanScreen> {
  // final AudioPlayer _audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  // Duration _duration = Duration.zero;
  // Duration _position = Duration.zero;
  // Timer? _timer;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   //_audioPlayer.setAsset('assets/videos/Shiva-Shiva.mp3');
  //
  //   _audioPlayer.durationStream.listen((duration) {
  //     if (mounted) {
  //       setState(() {
  //         _duration = duration ?? Duration.zero;
  //       });
  //     }
  //   });
  //   _audioPlayer.positionStream.listen((position) {
  //     if (mounted) {
  //       setState(() {
  //         _position = position;
  //       });
  //     }
  //   });
  // }
  //
  // void _playPause() async {
  //   if (isPlaying) {
  //     await _audioPlayer.pause();
  //     _timer?.cancel();
  //   } else {
  //     await _audioPlayer.play();
  //     _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
  //       final position = _audioPlayer.position;
  //       if (mounted) {
  //         setState(() {
  //           _position = position;
  //         });
  //       } else {
  //         _timer?.cancel();
  //       }
  //     });
  //   }
  //   if (mounted) {
  //     setState(() {
  //       isPlaying = !isPlaying;
  //     });
  //   }
  // }
  //
  // void _stop() async {
  //   await _audioPlayer.stop();
  //   _timer?.cancel();
  //   if (mounted) {
  //     setState(() {
  //       isPlaying = false;
  //       _position = Duration.zero;
  //     });
  //   }
  // }
  //
  // void _seek(Duration position) async {
  //   await _audioPlayer.seek(position);
  // }
  //
  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   _timer?.cancel();
  //   super.dispose();
  // }

  String? playingUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      if (mounted) {
        context.read<BhajanBloc>().add(LoadAudioList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "भजन",
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: BlocBuilder<BhajanBloc, BhajanState>(
          bloc: context.read<BhajanBloc>(),
          builder: (context, state) {
            List<BhajanResponseModel> audioList = [];

            if (state is AudioLoading) {
              return customCircularProgressIndicator();
            } else if (state is AudioLoaded) {
              audioList = state.audioList; // Extract audio list
            } else if (state is AudioPlaying && state is AudioPaused) {
              audioList =
                  (state as dynamic)
                      .audioList; // Ensure we always have the list
            } else if (state is AudioError) {
              return Center(child: Text(state.message));
            }

            return ListView.builder(
              itemCount: audioList.length,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                dynamic duration = Duration.zero;
                dynamic position = Duration.zero;

                if (state is AudioPlaying) {
                  duration = state.duration;
                  position = state.position;
                }

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  margin: EdgeInsets.all(10.0),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              audioList[index].fileName,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                final bhajanBloc = context.read<BhajanBloc>();

                                setState(() {
                                  if (playingUrl == audioList[index].url &&
                                      bhajanBloc.isPlaying) {
                                    // If the clicked item is playing, stop it
                                    bhajanBloc.add(StopAudio(isPlaying: false));
                                    playingUrl =
                                        null; // Reset to no audio playing
                                  } else {
                                    // Play new audio and update the playing URL
                                    bhajanBloc.add(
                                      PlayAudio(
                                        url: audioList[index].url,
                                        isPlaying: true,
                                      ),
                                    );
                                    playingUrl =
                                        audioList[index]
                                            .url; // Update playing URL
                                  }
                                });

                                // setState(() {
                                //   if (context.read<BhajanBloc>().isPlaying) {
                                //     context.read<BhajanBloc>().add(
                                //       StopAudio(isPlaying: false),
                                //     );
                                //   } else {
                                //     context.read<BhajanBloc>().add(
                                //       PlayAudio(
                                //         url: audioList[index].url,
                                //         isPlaying: true,
                                //       ),
                                //     );
                                //   }
                                // });
                              },
                              child: Icon(
                                playingUrl == audioList[index].url
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                color: AppColor.backgroundColor,
                                size: 48.0,
                              ),
                            ),
                          ],
                        ),
                        // // ✅ Seek Bar & Duration
                        // SizedBox(height: 8.0),
                        // playingUrl == audioList[index].url
                        //     ? Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Slider(
                        //           min: 0.0,
                        //           activeColor: AppColor.backgroundColor,
                        //
                        //           max:
                        //               duration.inSeconds > 0
                        //                   ? duration.inSeconds.toDouble()
                        //                   : 1.0,
                        //           value:
                        //               duration.inSeconds > 0
                        //                   ? position.inSeconds.toDouble().clamp(
                        //                     0.0,
                        //                     duration.inSeconds.toDouble(),
                        //                   )
                        //                   : 0.0,
                        //           onChanged: (value) {
                        //             context.read<BhajanBloc>().add(
                        //               SeekAudio(
                        //                 Duration(seconds: value.toInt()),
                        //               ),
                        //             );
                        //           },
                        //         ),
                        //         Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               context.read<BhajanBloc>().formatDuration(
                        //                 position,
                        //               ),
                        //             ), // Current Time
                        //             Text(
                        //               context.read<BhajanBloc>().formatDuration(
                        //                 duration,
                        //               ),
                        //             ), // Total Duration
                        //           ],
                        //         ),
                        //       ],
                        //     )
                        //     : Container(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
