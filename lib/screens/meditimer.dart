import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color.dart';
import '../utils/reusableWidgets.dart';
import '../widgets/round-button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:audioplayers/audioplayers.dart';

class MediTimer extends StatefulWidget {
  const MediTimer({Key? key}) : super(key: key);

  @override
  _MediTimerState createState() => _MediTimerState();
}

class _MediTimerState extends State<MediTimer> with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;
  final player = AudioPlayer();

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:02') {
      FlutterRingtonePlayer.playAlarm(asAlarm: true);
    } else if (countText == '0:00:00') {
      player.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // aligning logo
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/background.jpg"),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    color: HexColor.fromHex("B057D2"),
                    value: progress,
                    strokeWidth: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: textStyle(
                          'JosefinSans', FontWeight.bold, 70.0, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: const Alignment(0, 0.5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.isAnimating) {
                          controller.stop();
                          setState(() {
                            isPlaying = false;
                          });
                          player.pause();

                        } else {
                          controller.reverse(
                              from: controller.value == 0
                                  ? 1.0
                                  : controller.value);
                          setState(() {
                            isPlaying = true;
                          });
                          player.setVolume(1.0);
                          player.play('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/2c/f8/b8/2cf8b8e6-8fa6-fefd-803c-1de8fd15c292/mzaf_12121007870669936158.plus.aac.ep.m4a ');
                        }
                      },
                      child: RoundButton(
                        icon:
                            isPlaying == true ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.reset();
                        setState(() {
                          isPlaying = false;
                        });
                        player.stop();
                      },
                      child: const RoundButton(
                        icon: Icons.stop,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          player.setVolume(0.0);
                        },
                        child: const RoundButton(
                          icon: Icons.volume_off,
                        )),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
