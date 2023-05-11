// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePagePill extends StatelessWidget {
  var Index;
  HomePagePill({super.key, this.Index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 38,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 6, 114, 128),
        ),
        child: Center(
            child: Text(
          'Genre $Index',
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
