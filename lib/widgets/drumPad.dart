import 'package:drums_pad/widgets/singlePad.dart';
import 'package:flutter/material.dart';

class FullDrumPad extends StatelessWidget {
  const FullDrumPad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: const [
              PadType4(),
              PadType4(),
              PadType4(),
            ],
          ),
          Row(
            children: const [
              PadType6(),
              PadType7(),
              PadType4(),
            ],
          ),
          Row(
            children: const [
              PadType6(),
              PadType6(),
              PadType6(),
            ],
          ),
          Row(
            children: const [
              PadType5(),
              PadType1(),
              PadType5(),
            ],
          ),
        ],
      ),
    );
  }
}
