// ignore_for_file: file_names, avoid_print

import 'package:drums_pad/widgets/singlePad.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../services/musicPlay.dart';

class FullDrumPad extends StatefulWidget {
  const FullDrumPad({super.key});

  @override
  State<FullDrumPad> createState() => _FullDrumPadState();
}

class _FullDrumPadState extends State<FullDrumPad> {
  late AudioPlayer audioPlayer;
  late AudioPlayer audioPlayer2;
  // bool isPlaying = false;
  // bool isPaused = false;
  // final duration = await audioPlayer.setUrl(
  //       'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FBangalore%20Days%20Wedding%20Song%20%20Maangalyam%20%20Dulquer%20Salmaan%20%20Nivin%20Pauly%20%20Fahadh%20Faasil%20%20Nazriya.mp3?alt=media&token=de99dbaf-1292-4667-8dd7-bd4eadd5a80a');
  // var source;
  // String path =
  //     'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FBangalore%20Days%20Wedding%20Song%20%20Maangalyam%20%20Dulquer%20Salmaan%20%20Nivin%20Pauly%20%20Fahadh%20Faasil%20%20Nazriya.mp3?alt=media&token=de99dbaf-1292-4667-8dd7-bd4eadd5a80a';

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
    audioPlayer2 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
    // audioPlayer.play;
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  audioPlayer.play();
                  print('1');
                },
                child: const PadType4(),
              ),
              GestureDetector(
                onTap: () {
                  audioPlayer2.play();
                  print('2');
                },
                child: const PadType4(),
              ),
              GestureDetector(
                onTap: () {
                  print('3');
                },
                child: const PadType4(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('4');
                },
                child: const PadType6(),
              ),
              GestureDetector(
                onTap: () {
                  print('5');
                },
                child: const PadType7(),
              ),
              GestureDetector(
                onTap: () {
                  print('6');
                },
                child: const PadType4(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('7');
                },
                child: const PadType6(),
              ),
              GestureDetector(
                onTap: () {
                  print('8');
                },
                child: const PadType6(),
              ),
              GestureDetector(
                onTap: () {
                  print('9');
                },
                child: const PadType6(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('10');
                },
                child: const PadType5(),
              ),
              GestureDetector(
                onTap: () {
                  print('11');
                },
                child: const PadType1(),
              ),
              GestureDetector(
                onTap: () {
                  print('12');
                },
                child: const PadType5(),
              ),
            ],
          ),
          MusicPlay(audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}
