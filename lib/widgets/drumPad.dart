// ignore_for_file: file_names, avoid_print

import 'package:drums_pad/widgets/singlePad.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../services/musicPlay.dart';

class FullDrumPadA extends StatefulWidget {
  FullDrumPadA({
    super.key,
    required this.currentPage,
    required this.audioPlayer1,
    required this.audioPlayer2,
    required this.audioPlayer3,
    required this.audioPlayer4,
  });
  String currentPage;
  final AudioPlayer audioPlayer1;
  final AudioPlayer audioPlayer2;
  final AudioPlayer audioPlayer3;
  final AudioPlayer audioPlayer4;

  @override
  State<FullDrumPadA> createState() => _FullDrumPadAState();
}

class _FullDrumPadAState extends State<FullDrumPadA> {
  late AudioPlayer audioPlayer1;
  late AudioPlayer audioPlayer2;
  late AudioPlayer audioPlayer3;
  late AudioPlayer audioPlayer4;

  @override
  void initState() {
    setState(() {
      widget.currentPage = 'A';
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  playButton(Player) {
    Player.stop();
    Player.seek(const Duration(seconds: 0));
    Player.play();
  }

  stopAll() {
    widget.audioPlayer1.stop();
    widget.audioPlayer2.stop();
    widget.audioPlayer3.stop();
    widget.audioPlayer4.stop();
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
                  playButton(widget.audioPlayer1);
                  print('1');
                },
                child: const PadType4(),
              ),
              GestureDetector(
                onTap: () {
                  playButton(widget.audioPlayer2);
                  print('2');
                },
                child: const PadType4(),
              ),
              GestureDetector(
                onTap: () {
                  playButton(widget.audioPlayer3);
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
                  playButton(widget.audioPlayer4);
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
          MusicPlay(audioPlayer: widget.audioPlayer1),
          IconButton(
            onPressed: () => stopAll(),
            icon: const Icon(Icons.play_arrow_rounded),
            iconSize: 33,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}

class FullDrumPadB extends StatefulWidget {
  FullDrumPadB({
    super.key,
    required this.currentPage,
    required this.audioPlayer1,
    required this.audioPlayer2,
    required this.audioPlayer3,
    required this.audioPlayer4,
  });
  String currentPage;
  final AudioPlayer audioPlayer1;
  final AudioPlayer audioPlayer2;
  final AudioPlayer audioPlayer3;
  final AudioPlayer audioPlayer4;

  @override
  State<FullDrumPadB> createState() => _FullDrumPadBState();
}

class _FullDrumPadBState extends State<FullDrumPadB> {
  @override
  void initState() {
    setState(() {
      widget.currentPage = 'B';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  playButton(Player) {
    Player.stop();
    Player.seek(const Duration(seconds: 0));
    Player.play();
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
                  playButton(widget.audioPlayer1);
                  print('1');
                },
                child: const PadType1(),
              ),
              GestureDetector(
                onTap: () {
                  playButton(widget.audioPlayer2);
                  print('2');
                },
                child: const PadType1(),
              ),
              GestureDetector(
                onTap: () {
                  playButton(widget.audioPlayer3);
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
                  playButton(widget.audioPlayer4);
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
          MusicPlay(audioPlayer: widget.audioPlayer1),
        ],
      ),
    );
  }
}
