import 'package:drums_pad/widgets/navigationButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/home.dart';
import '../widgets/sideBar.dart';
import 'myMusicPage.dart';
import 'tutorialPage.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  List<IconData> listOfIcons = [
    Icons.home_filled,
    Icons.music_video,
    Icons.play_circle_outline,
  ];

  List<String> listOfStrings = [
    'Home',
    'My Music',
    'Tutorial',
  ];

  var currentIndex = 0;

  List<Widget> pages = [
    const Home(),
    const MyMusicPage(),
    const TutorialPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const SideBar(),
      body: pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: displayWidth * .20,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 83, 83, 103),
            width: 2,
          ),
          color: const Color.fromARGB(255, 34, 35, 49),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    HapticFeedback.lightImpact();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: NavigationButton(
                    index: index,
                    cindex: currentIndex,
                    buttonIcons: listOfIcons[index],
                    buttonText: listOfStrings[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
