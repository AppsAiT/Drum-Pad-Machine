// ignore_for_file: file_names

import 'package:drums_pad/widgets/tutorialTiles.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'homePage.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Center(
              child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 32, 31, 43),
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyHomePage(title: APP_NAME)));
                          },
                          icon: const Icon(
                            Icons.arrow_circle_left_outlined,
                            color: Colors.cyan,
                            size: 33,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Tutorials',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Color.fromARGB(255, 32, 31, 43),
                          size: 33,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 83),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TutorialTile(index: index),
            ),
          ),
        ),
      ],
    );
  }
}
