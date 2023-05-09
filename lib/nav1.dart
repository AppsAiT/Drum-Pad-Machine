import 'package:drums_pad/constants.dart';
import 'package:flutter/material.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.home_filled,
    Icons.music_video_sharp,
    Icons.play_circle_outline,
  ];
  List<String> titles = [
    'Home',
    'My Music',
    'Tutorial',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
                color: Color.fromARGB(255, 57, 59, 71), width: 2)),
        elevation: 10,
        color: const Color.fromARGB(255, 21, 21, 27),
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: GestureDetector(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 70,
                  child: Column(
                    children: [
                      Icon(
                        data[i],
                        size: 35,
                        color: i == selectedIndex
                            ? Colors.cyan
                            : const Color.fromARGB(255, 57, 59, 71),
                      ),
                      Text(
                        titles[i],
                        style: TextStyle(
                          color: i == selectedIndex
                              ? Colors.cyan
                              : const Color.fromARGB(255, 57, 59, 71),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
