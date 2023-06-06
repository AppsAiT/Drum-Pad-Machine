// ignore_for_file: file_names
import 'package:drums_pad/widgets/drumPad.dart';
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
        frontBuilder: (_) => FullDrumPadA(
            // onFlip: () => pageFlipKey.currentState?.flip(),
            ),
        backBuilder: (_) => FullDrumPadB(
            // onFlip: () => pageFlipKey.currentState?.flip(),
            ),
        flipAxis: Axis.horizontal,
        maxTilt: 0.003,
        maxScale: 0.2,
      ),
    );
  }
}
