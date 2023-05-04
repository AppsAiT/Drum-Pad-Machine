import 'package:flutter/material.dart';

class CaroselContainer extends StatelessWidget {
  const CaroselContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent,
      ),
      child: Stack(children: [
        Column(
          children: [
            const Spacer(),
            Container(
              height: 60,
              width: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.amber,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
