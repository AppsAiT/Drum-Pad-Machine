import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

import 'starRating.dart';

class TutorialTile extends StatelessWidget {
  final int index;

  const TutorialTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 32, 31, 43),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: <Widget>[
                Text(
                  'Lesson ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'Assets/icons/equalizer.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                Text(
                  'A',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Current Rank',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: StarRating(totalStars: 5, stars: 3),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Last Score',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 35,
                          lineWidth: 10,
                          animation: true,
                          percent: 0.6,
                          center: const Text(
                            "60%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.black,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.cyan,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Best Score',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 10,
                          animation: true,
                          percent: 0.8,
                          center: const Text(
                            "80%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Colors.black,
                          progressColor: Colors.cyan,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Container(
                  height: 40,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Play',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
