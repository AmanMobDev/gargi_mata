import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';
import '../bloc/audio_event.dart';
import '../bloc/audio_player_bloc.dart';
import '../bloc/audio_state.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      if (mounted) {
        context.read<AudioBloc>().add(LoadAudioList());
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "भजन",
      child: BlocBuilder<AudioBloc, AudioState>(
        builder: (context, state) {
          List<BhajanResponseModel> audioList = [];

          if (state is AudioLoading) {
            return customCircularProgressIndicator();
          } else if (state is AudioLoaded) {
            audioList = state.audioList; // Extract audio list
          } else if (state is AudioPlaying && state is AudioPaused) {
            audioList =
                (state as dynamic).audioList; // Ensure we always have the list
          } else if (state is AudioError) {
            return Center(child: Text(state.message));
          }

          return ListView.builder(
            itemCount: audioList.length,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              // ✅ Get duration and current position
              final Duration duration =
                  state is AudioPlaying ? Duration.zero : Duration.zero;
              final Duration position =
                  state is AudioPlaying ? Duration.zero : Duration.zero;

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
                              if (context.read<AudioBloc>().isPlaying) {
                                context.read<AudioBloc>().add(
                                  StopAudio(isPlaying: false),
                                );
                              } else {
                                context.read<AudioBloc>().add(
                                  PlayAudio(
                                    url: audioList[index].url,
                                    isPlaying: true,
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              context.read<AudioBloc>().isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_filled,
                              color: AppColor.backgroundColor,
                              size: 48.0,
                            ),
                          ),
                        ],
                      ),
                      // ✅ Seek Bar & Duration
                      SizedBox(height: 8.0),
                      BlocBuilder<AudioBloc, AudioState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Slider(
                                min: 0.0,
                                activeColor: AppColor.backgroundColor,

                                max: duration.inSeconds.toDouble(),
                                value: position.inSeconds.toDouble().clamp(
                                  00.0,
                                  duration.inSeconds.toDouble(),
                                ),
                                onChanged: (value) {
                                  context.read<AudioBloc>().add(
                                    SeekAudio(Duration(seconds: value.toInt())),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _formatDuration(position),
                                  ), // Current Time
                                  Text(
                                    _formatDuration(duration),
                                  ), // Total Duration
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      // BlocBuilder<AudioBloc, AudioState>(
      //   builder: (context, state) {
      //     if (state is AudioLoading) {
      //       return customCircularProgressIndicator();
      //     } else if (state is AudioLoaded) {
      //       return ListView.builder(
      //         itemCount: state.audioList.length,
      //         itemBuilder: (context, index) {
      //           bool isPlaying = state is AudioPlaying;
      //           return Card(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15.0),
      //             ),
      //             margin: EdgeInsets.all(10.0),
      //             elevation: 10.0,
      //             child: Padding(
      //               padding: const EdgeInsets.all(10.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         state.audioList[index].fileName,
      //                         style: TextStyle(
      //                           fontSize: 14.0,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //
      //                       GestureDetector(
      //                         onTap: () {
      //                           if (isPlaying) {
      //                             context.read<AudioBloc>().add(StopAudio());
      //                           } else {
      //                             context.read<AudioBloc>().add(
      //                               PlayAudio(state.audioList[index].url),
      //                             );
      //                           }
      //                         },
      //                         child: Icon(
      //                           isPlaying
      //                               ? Icons.pause_circle_filled
      //                               : Icons.play_circle_filled,
      //                           color: AppColor.backgroundColor,
      //                           size: 48.0,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   //SizedBox(height: 10.0),
      //                   // BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      //                   //   builder: (context, state) {
      //                   //     final position =
      //                   //         state is AudioPlayingState
      //                   //             ? state.position
      //                   //             : Duration.zero;
      //                   //     final duration =
      //                   //         state is AudioPlayingState
      //                   //             ? state.duration
      //                   //             : Duration.zero;
      //                   //     return Column(
      //                   //       children: [
      //                   //         Slider(
      //                   //           min: 0.0,
      //                   //           max: duration.inSeconds.toDouble(),
      //                   //           value: position.inSeconds.toDouble().clamp(
      //                   //             0.0,
      //                   //             duration.inSeconds.toDouble(),
      //                   //           ),
      //                   //           onChanged: (value) {
      //                   //             context.read<AudioPlayerBloc>().add(
      //                   //               SeekAudioEvent(Duration(seconds: value.toInt())),
      //                   //             );
      //                   //           },
      //                   //         ),
      //                   //         Row(
      //                   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   //           children: [
      //                   //             Text(_formatDuration(position)),
      //                   //             Text(_formatDuration(duration)),
      //                   //           ],
      //                   //         ),
      //                   //       ],
      //                   //     );
      //                   //   },
      //                   // ),
      //                 ],
      //               ),
      //             ),
      //           );
      //           ;
      //         },
      //       );
      //     } else if (state is AudioError) {
      //       return Center(child: Text(state.message));
      //     }
      //     return Container();
      //   },
      // ),
      // child: BlocBuilder<AudioBloc, AudioState>(
      //   builder: (context, state) {
      //     if (state is AudioLoading) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (state is AudioLoaded) {
      //       return ListView.builder(
      //         itemCount: state.audioList.length,
      //         itemBuilder: (context, index) {
      //           final audio = state.audioList[index];
      //           debugPrint("Audio Url:::${audio.url}");
      //           return ListTile(
      //             title: Text(audio.fileName, style: TextStyle(fontSize: 18)),
      //             trailing: BlocBuilder<AudioBloc, AudioState>(
      //               builder: (context, audioState) {
      //                 bool isPlaying =
      //                     (audioState is AudioPlaying &&
      //                         audioState.url == audio.url);
      //                 return IconButton(
      //                   icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
      //                   onPressed: () {
      //                     if (isPlaying) {
      //                       context.read<AudioBloc>().add(StopAudio());
      //                     } else {
      //                       context.read<AudioBloc>().add(PlayAudio(audio.url));
      //                     }
      //                   },
      //                 );
      //               },
      //             ),
      //           );
      //         },
      //       );
      //     } else if (state is AudioError) {
      //       return Center(child: Text(state.message));
      //     }
      //     return Center(child: Text("No Data"));
      //   },
      // ),

      // StreamBuilder<List<BhajanResponseModel>>(
      //   stream: context.read<BhajanBloc>().getBhajanUseCase(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return customCircularProgressIndicator();
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Center(child: Text("No data available"));
      //     } else {
      //       final bhajanDataList = snapshot.data!;
      //
      //       return ListView.builder(
      //         itemCount: bhajanDataList.length,
      //         itemBuilder: (context, index) {
      //           return BhajanCard(bhajan: bhajanDataList[index]);
      //         },
      //       );
      //     }
      //   },
      // ),
    );
  }
}
