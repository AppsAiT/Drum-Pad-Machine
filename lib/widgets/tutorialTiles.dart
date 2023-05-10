import 'package:flutter/material.dart';

class TutorialTile extends StatelessWidget {
  final int index;

  const TutorialTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 32, 31, 43),
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
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
                        const Text(
                          'Last Score',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          color: Colors.cyan,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        const Text(
                          'Best Score',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          color: Colors.cyan,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 40,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
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
