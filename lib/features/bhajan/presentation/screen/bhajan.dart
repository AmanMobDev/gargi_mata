import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_bloc.dart';
import 'package:gargi_mata/features/bhajan/presentation/bloc/bhajan_events.dart';

import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';
import '../widget/bhajan_card.dart';

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
    context.read<BhajanBloc>().add(GetBhajanInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "",
      child: StreamBuilder<List<BhajanResponseModel>>(
        stream: context.read<BhajanBloc>().getBhajanUseCase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return customCircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            final bhajanDataList = snapshot.data!;

            return ListView.builder(
              itemCount: bhajanDataList.length,
              itemBuilder: (context, index) {
                return BhajanCard(bhajan: bhajanDataList[index]);
              },
            );
          }
        },
      ),
    );
  }
}
