// ignore_for_file: unused_field, prefer_final_fields, file_names

import 'package:drums_pad/widgets/drumPad.dart';
import 'package:drums_pad/widgets/flipButton.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:volume_controller/volume_controller.dart';

class DrumPadPage extends StatefulWidget {
  const DrumPadPage({super.key});

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

  Duration duration = Duration.zero;
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

  final audioSource = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FBangalore%20Days%20Wedding%20Song%20%20Maangalyam%20%20Dulquer%20Salmaan%20%20Nivin%20Pauly%20%20Fahadh%20Faasil%20%20Nazriya.mp3?alt=media&token=de99dbaf-1292-4667-8dd7-bd4eadd5a80a'));
  final audioSource2 = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FSamp2.wav?alt=media&token=edabfe81-3613-4d7e-8229-1f14c5160c5c'));
  final audioSource3 = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/DemoSong%2Ftunes%2Fsub-synth-electro-pluck-one-shot_F_major.wav?alt=media&token=3fc82031-873a-46ba-8821-2c566ccb8c0f'));

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

  splitSong() async {
    setState(() {
      duration = audioPlayerA1.duration ?? Duration.zero;
      A = ((duration.inSeconds) / 4).floor();
    });

    print('============> $duration');
    print('============> $A');
  }

  init() {}

  @override
  void initState() {
    super.initState();
    // Listen to system volume change
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
    audioPlayerB3 = AudioPlayer()..setAudioSource(audioSource2);
    audioPlayerB4 = AudioPlayer()..setAudioSource(audioSource2);
    audioPlayerB10 = AudioPlayer()..setAudioSource(audioSource3);

    splitSong();
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    audioPlayerA1.dispose();
    audioPlayerA2.dispose();
    audioPlayerA3.dispose();
    audioPlayerA4.dispose();
    super.dispose();
  }

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
                  Row(
                    children: const [
                      Icon(
                        Icons.settings_backup_restore_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          '123 BPM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 140,
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
                  Row(
                    children: const [
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
                ],
              ),
            ),
          ),
          // Center(
          //   child: IconButton(
          //     onPressed: () {
          //       if (tempPlaying) {
          //         audioPlayerA1.stop();
          //         audioPlayerA1.seek(const Duration(seconds: 0));
          //         tempPlaying = false;
          //       } else {
          //         audioPlayerA1.play();
          //         tempPlaying = true;
          //       }
          //     },
          //     icon: const Icon(
          //       Icons.play_arrow_rounded,
          //       color: Colors.amber,
          //       size: 36,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: PageFlipBuilder(
              key: pageFlipKey,
              frontBuilder: (_) => FullDrumPadA(
                currentPage: currentPad,
                audioPlayer1: audioPlayerA1,
                audioPlayer2: audioPlayerA2,
                audioPlayer3: audioPlayerA3,
                audioPlayer4: audioPlayerA4,
                duration: A,
              ),
              backBuilder: (_) => FullDrumPadB(
                currentPage: currentPad,
                audioPlayer1: audioPlayerB1,
                audioPlayer2: audioPlayerB2,
                audioPlayer3: audioPlayerB3,
                audioPlayer4: audioPlayerB4,
                duration: A,
              ),
              flipAxis: Axis.horizontal,
              maxTilt: 0.003,
              maxScale: 0.2,
            ),
          ),
        ],
      )),
    );
  }
}
