// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyMusicButton extends StatelessWidget {
  final IconData buttonIcon;
  final String buttonText;
  const MyMusicButton(
      {super.key, required this.buttonIcon, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 32, 31, 43),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Icon(
              buttonIcon,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 15),
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
