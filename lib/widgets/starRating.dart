import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  int totalStars;
  int stars;
  StarRating({super.key, required this.totalStars, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 17,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                color: const Color.fromARGB(0, 255, 255, 255),
                width: 17,
                child: Image.asset(
                  'Assets/Star_Grey.png',
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 17,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                color: const Color.fromARGB(0, 255, 255, 255),
                width: 17,
                child: Image.asset(
                  'Assets/Star_Yellow.png',
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
