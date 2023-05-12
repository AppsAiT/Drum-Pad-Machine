import 'dart:ui';

import 'package:drums_pad/widgets/singlePad.dart';
import 'package:flutter/material.dart';

class FullDrumPad extends StatelessWidget {
  const FullDrumPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: const [
              PadType5(),
              PadType1(),
              PadType2(),
            ],
          ),
          Row(
            children: const [
              PadType3(),
              PadType3(),
              PadType4(),
            ],
          ),
        ],
      ),
    );
  }
}
