// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlay extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const MusicPlay({
    super.key,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: audioPlayer.play,
            icon: const Icon(Icons.play_arrow_rounded),
            iconSize: 33,
            color: Colors.cyan,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: audioPlayer.pause,
            icon: const Icon(Icons.pause),
            iconSize: 33,
            color: Colors.cyan,
          );
        }
        return const Icon(
          Icons.error,
          size: 33,
          color: Colors.cyan,
        );
      },
    );
  }
}
