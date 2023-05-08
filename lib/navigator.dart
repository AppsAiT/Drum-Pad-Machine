import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:drums_pad/constants.dart';
import 'package:flutter/material.dart';

import 'pages/homePage.dart';
import 'pages/myMusicPage.dart';
import 'pages/tutorialPage.dart';

class NavigatorBar2 extends StatefulWidget {
  const NavigatorBar2({super.key});

  @override
  State<NavigatorBar2> createState() => _NavigatorBar2State();
}

class _NavigatorBar2State extends State<NavigatorBar2> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          MyHomePage(title: APP_NAME),
          MyMusicPage(),
          TutorialPage(),
        ],
        // onPageChanged: (index) {
        //   setState(() => _currentIndex = index);
        // },
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: 0,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(
          () {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn);
          },
        ),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Colors.cyan,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
            activeColor: Colors.cyan,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.menu_book),
            title: const Text('Tutorial'),
            activeColor: Colors.cyan,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.music_note),
            title: const Text('My Music'),
            activeColor: Colors.cyan,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
