// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  IconData buttonIcons;
  String buttonText;
  var index, cindex;

  NavigationButton({
    super.key,
    required this.index,
    required this.cindex,
    required this.buttonIcons,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Icon(
            buttonIcons,
            size: 30,
            color: index == cindex
                ? Colors.cyan
                : const Color.fromARGB(255, 83, 83, 103),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: index == cindex
                    ? Colors.cyan
                    : const Color.fromARGB(255, 83, 83, 103),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
