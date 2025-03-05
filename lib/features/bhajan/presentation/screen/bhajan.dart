import 'dart:async';

import 'package:just_audio/just_audio.dart';

import '../../../../config/exports/app_export.dart';

class BhajanScreen extends StatefulWidget {
  const BhajanScreen({super.key});

  @override
  State<BhajanScreen> createState() => _BhajanScreenState();
}

class _BhajanScreenState extends State<BhajanScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setAsset('assets/videos/Shiva-Shiva.mp3');
    _audioPlayer.durationStream.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration ?? Duration.zero;
        });
      }
    });
    _audioPlayer.positionStream.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });
  }

  void _playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
      _timer?.cancel();
    } else {
      await _audioPlayer.play();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
        final position = _audioPlayer.position;
        if (mounted) {
          setState(() {
            _position = position;
          });
        } else {
          _timer?.cancel();
        }
      });
    }
    if (mounted) {
      setState(() {
        isPlaying = !isPlaying;
      });
    }
  }

  void _stop() async {
    await _audioPlayer.stop();
    _timer?.cancel();
    if (mounted) {
      setState(() {
        isPlaying = false;
        _position = Duration.zero;
      });
    }
  }

  void _seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "",
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.all(10.0),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shiva Shiva",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: isPlaying ? _stop : _playPause,
                        child: Icon(
                          isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          color: AppColor.backgroundColor,
                          size: 48.0,
                        ),
                      ),
                    ],
                  ),
                  isPlaying
                      ? Slider(
                        min: 0,
                        thumbColor: AppColor.backgroundColor,
                        activeColor: AppColor.backgroundColor,
                        max: _duration.inSeconds.toDouble(),
                        value: _position.inSeconds.toDouble().clamp(
                          0.0,
                          _duration.inSeconds.toDouble(),
                        ),
                        onChanged: (value) {
                          _seek(Duration(seconds: value.toInt()));
                        },
                      )
                      : Container(),
                  isPlaying
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_position.toString().split('.').first),
                            Text(_duration.toString().split('.').first),
                          ],
                        ),
                      )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
