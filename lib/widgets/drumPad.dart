// ignore_for_file: file_names, avoid_print

import 'package:drums_pad/widgets/singlePad.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../services/musicPlay.dart';

class FullDrumPadA extends StatefulWidget {
  const FullDrumPadA({super.key});

  @override
  State<FullDrumPadA> createState() => _FullDrumPadAState();
}

class _FullDrumPadAState extends State<FullDrumPadA> {
  late AudioPlayer audioPlayer1;
  late AudioPlayer audioPlayer2;
  late AudioPlayer audioPlayer3;
  late AudioPlayer audioPlayer4;
  final audioSource = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FBangalore%20Days%20Wedding%20Song%20%20Maangalyam%20%20Dulquer%20Salmaan%20%20Nivin%20Pauly%20%20Fahadh%20Faasil%20%20Nazriya.mp3?alt=media&token=de99dbaf-1292-4667-8dd7-bd4eadd5a80a'));

  @override
  void initState() {
    super.initState();
    audioPlayer1 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayer1.setClip(
        start: const Duration(seconds: 5), end: const Duration(seconds: 20));
    audioPlayer2 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
    audioPlayer3 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
    audioPlayer4 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
  }

  @override
  void dispose() {
    audioPlayer1.dispose();
    audioPlayer2.dispose();
    audioPlayer3.dispose();
    audioPlayer4.dispose();
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
                  audioPlayer1.play();
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
                  audioPlayer3.play();
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
                  audioPlayer4.play();
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
          MusicPlay(audioPlayer: audioPlayer1),
        ],
      ),
    );
  }
}

class FullDrumPadB extends StatefulWidget {
  const FullDrumPadB({super.key});

  @override
  State<FullDrumPadB> createState() => _FullDrumPadBState();
}

class _FullDrumPadBState extends State<FullDrumPadB> {
  late AudioPlayer audioPlayer1;
  late AudioPlayer audioPlayer2;
  late AudioPlayer audioPlayer3;
  late AudioPlayer audioPlayer4;
  final audioSource = LockCachingAudioSource(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/drumpad-appsait.appspot.com/o/songs%2FBangalore%20Days%20Wedding%20Song%20%20Maangalyam%20%20Dulquer%20Salmaan%20%20Nivin%20Pauly%20%20Fahadh%20Faasil%20%20Nazriya.mp3?alt=media&token=de99dbaf-1292-4667-8dd7-bd4eadd5a80a'));

  @override
  void initState() {
    super.initState();
    audioPlayer1 = AudioPlayer()..setAudioSource(audioSource);
    audioPlayer1.setClip(
        start: const Duration(seconds: 5), end: const Duration(seconds: 20));
    audioPlayer2 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
    audioPlayer3 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
    audioPlayer4 = AudioPlayer()..setAsset('Assets/audio/sampleAudio.mp3');
  }

  @override
  void dispose() {
    audioPlayer1.dispose();
    audioPlayer2.dispose();
    audioPlayer3.dispose();
    audioPlayer4.dispose();
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
                  audioPlayer1.play();
                  print('1');
                },
                child: const PadType1(),
              ),
              GestureDetector(
                onTap: () {
                  audioPlayer2.play();
                  print('2');
                },
                child: const PadType1(),
              ),
              GestureDetector(
                onTap: () {
                  audioPlayer3.play();
                  print('3');
                },
                child: const PadType1(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('4');
                },
                child: const PadType7(),
              ),
              GestureDetector(
                onTap: () {
                  print('5');
                },
                child: const PadType5(),
              ),
              GestureDetector(
                onTap: () {
                  audioPlayer4.play();
                  print('6');
                },
                child: const PadType1(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('7');
                },
                child: const PadType7(),
              ),
              GestureDetector(
                onTap: () {
                  print('8');
                },
                child: const PadType7(),
              ),
              GestureDetector(
                onTap: () {
                  print('9');
                },
                child: const PadType7(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('10');
                },
                child: const PadType6(),
              ),
              GestureDetector(
                onTap: () {
                  print('11');
                },
                child: const PadType4(),
              ),
              GestureDetector(
                onTap: () {
                  print('12');
                },
                child: const PadType6(),
              ),
            ],
          ),
          MusicPlay(audioPlayer: audioPlayer1),
        ],
      ),
    );
  }
}
