// ignore_for_file: file_names

import 'package:drums_pad/constants.dart';
import 'package:drums_pad/widgets/myMusicButtons.dart';
import 'package:flutter/material.dart';
import 'NewProjectPage.dart';
import 'homePage.dart';

class MyMusicPage extends StatelessWidget {
  const MyMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'My Music',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Color.fromARGB(255, 32, 31, 43),
                        size: 33,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const NewProjectPage(),
                  ),
                );
              },
              splashColor: Colors.cyan,
              child: const MyMusicButton(
                buttonIcon: Icons.add,
                buttonText: 'New Project',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: InkWell(
              onTap: () {},
              child: const MyMusicButton(
                buttonIcon: Icons.camera_outlined,
                buttonText: 'Recently Played',
              ),
            ),
          ),
        ],
      )),
    );
  }
}
