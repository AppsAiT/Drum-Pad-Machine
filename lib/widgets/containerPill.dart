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
        child: Center(
            child: Text(
          'Genre ${Index}',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 6, 114, 128),
        ),
      ),
    );
  }
}