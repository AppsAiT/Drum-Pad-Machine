import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 300,
      color: Color.fromARGB(255, 35, 35, 35),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            color: Colors.cyan,
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.headset_mic_rounded),
                  Text('Support'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
