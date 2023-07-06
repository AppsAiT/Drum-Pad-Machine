// ignore_for_file: file_names, avoid_print

import 'dart:async';

import 'package:drums_pad/widgets/singlePad.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FullDrumPadA extends StatefulWidget {
  FullDrumPadA({
    super.key,
    required this.currentPage,
    required this.audioPlayer1,
    required this.audioPlayer2,
    required this.audioPlayer3,
    required this.audioPlayer4,
    required this.duration,
  });
  String currentPage;
  final AudioPlayer audioPlayer1;
  final AudioPlayer audioPlayer2;
  final AudioPlayer audioPlayer3;
  final AudioPlayer audioPlayer4;
  final int duration;

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

  playButton(Player, time) {
    Player.stop();
    Player.seek(Duration(seconds: time));
    Player.play();
    Timer(Duration(seconds: widget.duration), () {
      Player.stop();
    });
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
              ZoomTapAnimation(
                onTap: () {
                  playButton(widget.audioPlayer1, 0);
                  print('1');
                },
                child: const PadType4(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer2.seek(Duration(seconds: widget.duration));
                  playButton(widget.audioPlayer2, widget.duration);
                  print('2');
                },
                child: const PadType4(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer3.seek(Duration(seconds: widget.duration));
                  playButton(widget.audioPlayer3, widget.duration * 2);
                  print('3');
                },
                child: const PadType4(),
              ),
            ],
          ),
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  widget.audioPlayer4.stop();
                  widget.audioPlayer4.seek(Duration.zero);
                  widget.audioPlayer4.play();
                  print('4');
                },
                child: const PadType6(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('5');
                },
                child: const PadType7(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer4
                  //     .seek(Duration(seconds: widget.duration * 3));
                  playButton(widget.audioPlayer4, widget.duration * 3);
                  print('6');
                },
                child: const PadType4(),
              ),
            ],
          ),
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  print('7');
                },
                child: const PadType6(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('8');
                },
                child: const PadType6(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('9');
                },
                child: const PadType6(),
              ),
            ],
          ),
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  print('10');
                },
                child: const PadType5(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('11');
                },
                child: const PadType1(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('12');
                },
                child: const PadType5(),
              ),
            ],
          ),
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
    required this.duration,
  });
  String currentPage;
  final AudioPlayer audioPlayer1;
  final AudioPlayer audioPlayer2;
  final AudioPlayer audioPlayer3;
  final AudioPlayer audioPlayer4;
  final int duration;

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

  playButton(Player, time) {
    Player.stop();
    Player.seek(Duration(seconds: time));
    Player.play();
    Timer(Duration(seconds: widget.duration), () {
      Player.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer1.seek(const Duration(seconds: 0));
                  playButton(widget.audioPlayer1, widget.duration * 4);
                  print('1');
                },
                child: const PadType1(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer2
                  //     .seek(Duration(seconds: widget.duration as int));
                  // print('===========> ${widget.duration}');
                  playButton(widget.audioPlayer2, widget.duration * 5);
                  print('2');
                },
                child: const PadType1(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer3
                  //     .seek(Duration(seconds: widget.duration * 2 as int));
                  // print('===========> ${(widget.duration) * 2}');
                  playButton(widget.audioPlayer3, widget.duration * 6);
                  print('3');
                },
                child: const PadType1(),
              ),
            ],
          ),
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  print('4');
                },
                child: const PadType7(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('5');
                },
                child: const PadType5(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  // widget.audioPlayer4
                  //     .seek(Duration(seconds: widget.duration * 3 as int));
                  // print('===========> ${widget.duration * 3}');
                  playButton(widget.audioPlayer4, widget.duration * 7);
                  print('6');
                },
                child: const PadType1(),
              ),
            ],
          ),
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  print('7');
                },
                child: const PadType7(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('8');
                },
                child: const PadType7(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('9');
                },
                child: const PadType7(),
              ),
            ],
          ),
          Row(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  print('10');
                },
                child: const PadType6(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('11');
                },
                child: const PadType4(),
              ),
              ZoomTapAnimation(
                onTap: () {
                  print('12');
                },
                child: const PadType6(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
