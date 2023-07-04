// ignore_for_file: unused_field, prefer_final_fields, file_names

import 'package:drums_pad/services/musicPlay.dart';
import 'package:drums_pad/widgets/drumPad.dart';
import 'package:drums_pad/widgets/flipButton.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:rxdart/rxdart.dart';
import 'package:volume_controller/volume_controller.dart';

class DrumPadPage extends StatefulWidget {
  const DrumPadPage({
    super.key,
    required this.link,
  });

  final String link;

  @override
  State<DrumPadPage> createState() => _DrumPadPageState();
}

class _DrumPadPageState extends State<DrumPadPage> {
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  var currentPad = 'A';
  var tempPlaying = false;

  late int duration;
  int A = 0;
  int B = 0;

  late AudioPlayer audioPlayerA1;
  late AudioPlayer audioPlayerA2;
  late AudioPlayer audioPlayerA3;
  late AudioPlayer audioPlayerA4;
  late AudioPlayer audioPlayerA5;
  late AudioPlayer audioPlayerA6;
  late AudioPlayer audioPlayerA7;
  late AudioPlayer audioPlayerA8;
  late AudioPlayer audioPlayerA9;
  late AudioPlayer audioPlayerA10;
  late AudioPlayer audioPlayerA11;
  late AudioPlayer audioPlayerA12;

  late AudioPlayer audioPlayerB1;
  late AudioPlayer audioPlayerB2;
  late AudioPlayer audioPlayerB3;
  late AudioPlayer audioPlayerB4;
  late AudioPlayer audioPlayerB5;
  late AudioPlayer audioPlayerB6;
  late AudioPlayer audioPlayerB7;
  late AudioPlayer audioPlayerB8;
  late AudioPlayer audioPlayerB9;
  late AudioPlayer audioPlayerB10;
  late AudioPlayer audioPlayerB11;
  late AudioPlayer audioPlayerB12;

  final audioSource2 = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FSamp2.wav?alt=media&token=edabfe81-3613-4d7e-8229-1f14c5160c5c'));
  final audioSource3 = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/DemoSong%2Ftunes%2Fsub-synth-electro-pluck-one-shot_F_major.wav?alt=media&token=3fc82031-873a-46ba-8821-2c566ccb8c0f'));

  var speed = [0.7, 1.0, 1.5, 2.0];
  var sindex = 1;

  OnFlip() {
    if (currentPad == 'A') {
      setState(() {
        currentPad = 'B';
      });
    } else {
      setState(() {
        currentPad = 'A';
      });
    }
    pageFlipKey.currentState!.flip();
  }

  setSpeed(index) {
    setState(() {
      audioPlayerA1.setSpeed(speed[index]);
      audioPlayerA2.setSpeed(speed[index]);
      audioPlayerA3.setSpeed(speed[index]);
      audioPlayerA4.setSpeed(speed[index]);
    });
  }

  @override
  void initState() {
    super.initState();
    final audioSource = LockCachingAudioSource(Uri.parse(widget.link));
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });
    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
    audioPlayerA1 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerA2 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerA3 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerA4 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerA10 = AudioPlayer()..setAudioSource(audioSource3);

    audioPlayerB1 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerB2 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerB3 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerB4 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayerB10 = AudioPlayer()..setAudioSource(audioSource3);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    audioPlayerA1.dispose();
    audioPlayerA2.dispose();
    audioPlayerA3.dispose();
    audioPlayerA4.dispose();
    audioPlayerA10.dispose();
    audioPlayerB1.dispose();
    audioPlayerB2.dispose();
    audioPlayerB3.dispose();
    audioPlayerB4.dispose();
    audioPlayerB10.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayerA1.positionStream,
        audioPlayerA1.bufferedPositionStream,
        audioPlayerA1.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 32, 31, 43),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Row(
                  children: [
                    FlipButton(
                      onFlip: () => OnFlip(),
                      P: currentPad,
                    ),
                    const Spacer(),
                    const Text(
                      'Dubstep Club',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.arrow_circle_down_outlined,
                        color: Colors.cyan,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 32, 31, 43),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (sindex == 3) {
                            sindex = 0;
                          } else {
                            sindex = sindex + 1;
                          }
                          setSpeed(sindex);
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings_backup_restore_outlined,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              '${speed[sindex]}x',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 130,
                        child: Slider.adaptive(
                          onChanged: (double value) {
                            setState(() {
                              _setVolumeValue = value;
                              VolumeController().setVolume(_setVolumeValue);
                            });
                          },
                          value: _setVolumeValue,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.emergency_recording_rounded,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '00:00:00',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final positionData = snapshot.data;
                  duration = positionData!.duration.inSeconds;
                  return Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: PageFlipBuilder(
                      key: pageFlipKey,
                      frontBuilder: (_) => FullDrumPadA(
                        currentPage: currentPad,
                        audioPlayer1: audioPlayerA1,
                        audioPlayer2: audioPlayerA2,
                        audioPlayer3: audioPlayerA3,
                        audioPlayer4: audioPlayerA4,
                        duration: duration ~/ 8,
                      ),
                      backBuilder: (_) => FullDrumPadB(
                        currentPage: currentPad,
                        audioPlayer1: audioPlayerB1,
                        audioPlayer2: audioPlayerB2,
                        audioPlayer3: audioPlayerB3,
                        audioPlayer4: audioPlayerB4,
                        duration: duration ~/ 8,
                      ),
                      flipAxis: Axis.horizontal,
                      maxTilt: 0.003,
                      maxScale: 0.2,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      )),
    );
  }
}
