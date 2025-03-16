// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_state.dart';
//
// import '../../../../config/color/app_color.dart';
// import '../../data/model/bhajan_response_model.dart';
// import '../bloc/bhajan_event.dart';
// import '../bloc/bhajan_bloc.dart';
//
// class BhajanCard extends StatelessWidget {
//   final BhajanResponseModel bhajan;
//
//   const BhajanCard({super.key, required this.bhajan});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//       margin: EdgeInsets.all(10.0),
//       elevation: 10.0,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   bhajan.fileName,
//                   style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
//                 ),
//                 BlocBuilder<AudioBloc, AudioState>(
//                   builder: (context, state) {
//                     bool isPlaying =
//                         state is AudioPlaying && state.url == bhajan.url;
//                     return GestureDetector(
//                       onTap: () {
//                         if (isPlaying) {
//                           context.read<AudioBloc>().add(StopAudio());
//                         } else {
//                           context.read<AudioBloc>().add(PlayAudio(bhajan.url));
//                         }
//                       },
//                       child: Icon(
//                         isPlaying
//                             ? Icons.pause_circle_filled
//                             : Icons.play_circle_filled,
//                         color: AppColor.backgroundColor,
//                         size: 48.0,
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.0),
//             // BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
//             //   builder: (context, state) {
//             //     final position =
//             //         state is AudioPlayingState
//             //             ? state.position
//             //             : Duration.zero;
//             //     final duration =
//             //         state is AudioPlayingState
//             //             ? state.duration
//             //             : Duration.zero;
//             //     return Column(
//             //       children: [
//             //         Slider(
//             //           min: 0.0,
//             //           max: duration.inSeconds.toDouble(),
//             //           value: position.inSeconds.toDouble().clamp(
//             //             0.0,
//             //             duration.inSeconds.toDouble(),
//             //           ),
//             //           onChanged: (value) {
//             //             context.read<AudioPlayerBloc>().add(
//             //               SeekAudioEvent(Duration(seconds: value.toInt())),
//             //             );
//             //           },
//             //         ),
//             //         Row(
//             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //           children: [
//             //             Text(_formatDuration(position)),
//             //             Text(_formatDuration(duration)),
//             //           ],
//             //         ),
//             //       ],
//             //     );
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes);
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return "$minutes:$seconds";
//   }
// }
