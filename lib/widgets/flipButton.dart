import 'package:flutter/material.dart';

class FlipButton extends StatelessWidget {
  const FlipButton({super.key, required this.onFlip, required this.P});
  final VoidCallback? onFlip;
  final String P;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: InkWell(
        onTap: onFlip,
        child: Column(
          children: [
            SizedBox(
              width: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: P == 'A'
                          ? Colors.white
                          : const Color.fromARGB(255, 98, 98, 98),
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: P == 'A'
                          ? const Color.fromARGB(255, 98, 98, 98)
                          : Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'B',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Side',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
