import 'package:drums_pad/constants.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/home.dart';
import 'myMusicPage.dart';
import 'tutorialPage.dart';

class NavigationEx extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _NavigationExState createState() => _NavigationExState();
}

class _NavigationExState extends State<NavigationEx> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Home(),
      const MyMusicPage(),
      const TutorialPage(),
    ];

    return MaterialApp(
      title: APP_NAME,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Floating NavBar Example'),
        //   centerTitle: true,
        // ),
        //If you want to show body behind the navbar, it should be true
        extendBody: true,
        backgroundColor: Colors.black,
        body: screens[_index],
        // body: Center(
        //   child: Text(
        //     "index: $_index",
        //     style: const TextStyle(
        //       color: Colors.white,
        //       fontSize: 52,
        //     ),
        //   ),
        // ),
        bottomNavigationBar: FloatingNavbar(
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(icon: Icons.home_filled, title: 'Home'),
            FloatingNavbarItem(
                icon: Icons.music_video_sharp, title: 'My Music'),
            FloatingNavbarItem(
                icon: Icons.play_circle_outline, title: 'Tutorial'),
          ],
        ),
      ),
    );
  }
}
