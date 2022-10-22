import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../utils/reusableWidgets.dart';

class podcastView extends StatefulWidget {
  const podcastView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PodcastState();
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}

class _PodcastState extends State<podcastView> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    //listen state: playing, pause or stop
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    //listen to audio duration changes
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    //repeat when completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    String url =
        'https://chtbl.com/track/39E17/podtrac.com/pts/redirect.mp3/traffic.omny.fm/d/clips/e73c998e-6e60-432f-8610-ae210140c5b1/96c5c41e-0bc8-4661-b184-ae32006cd726/00084fcc-5215-4fed-ba7b-aef4012a163a/audio.mp3';
    audioPlayer.setUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Move to Your Happy Place',
                  style: textStyle(
                      'JosefinSans', FontWeight.bold, 24.0, Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'The Happiness Lab',
                  style: textStyle(
                      'JosefinSans', FontWeight.w400, 18.0, Colors.white),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/home_page/Podcast1.png',
                      width: size.width * 0.75,
                      height: size.height * 0.4,
                      fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 32,
                ),
                Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.white,
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    //allow manually change audio position
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    //play audio if was paused
                    await audioPlayer.resume();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTime(position),
                          style: textStyle('JosefinSans', FontWeight.w300, 15.0,
                              Colors.white),
                        ),
                        //remaining time of podcast
                        Text(
                          formatTime(duration - position),
                          style: textStyle('JosefinSans', FontWeight.w300, 15.0,
                              Colors.white),
                        ),
                      ]),
                ),
                CircleAvatar(
                    radius: 35,
                    backgroundColor: HexColor.fromHex("B057D2"),
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      iconSize: 50,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
