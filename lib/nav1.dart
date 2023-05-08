import 'package:flutter/material.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.home_outlined,
    Icons.music_video_sharp,
    Icons.play_circle_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        child: Container(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: 35,
                  decoration: BoxDecoration(
                    border: i == selectedIndex
                        ? const Border(
                            top: BorderSide(width: 3.0, color: Colors.white))
                        : null,
                    gradient: i == selectedIndex
                        ? LinearGradient(
                            colors: [Colors.grey.shade800, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        : null,
                  ),
                  child: Icon(
                    data[i],
                    size: 35,
                    color: i == selectedIndex
                        ? Colors.white
                        : Colors.grey.shade800,
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
