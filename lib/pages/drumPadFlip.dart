// ignore_for_file: file_names

import 'package:drums_pad/pages/drumPadPageB.dart';
import 'package:drums_pad/pages/drumpadPageA.dart';
import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class DrumPadFlip extends StatelessWidget {
  DrumPadFlip({super.key});
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => DrumPadPageA(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        backBuilder: (_) => DrumPadPageB(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        flipAxis: Axis.horizontal,
        maxTilt: 0.003,
        maxScale: 0.2,
      ),
    );
  }
}
