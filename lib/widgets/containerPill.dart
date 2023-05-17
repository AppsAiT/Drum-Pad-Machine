// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePagePill extends StatelessWidget {
  var Index;
  HomePagePill({super.key, this.Index});

  var Genres = [
    'Assets/genres/HipHop.png',
    'Assets/genres/House.png',
    'Assets/genres/Rock.png',
    'Assets/genres/HipHop.png',
    'Assets/genres/Trap.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.cyan, width: 1),
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(Genres[Index]),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
