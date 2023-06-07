// ignore_for_file: file_names
import 'package:drums_pad/pages/drumpadScreen.dart';
import 'package:drums_pad/pages/myMusicPage.dart';
import 'package:flutter/material.dart';

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({super.key});

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 32, 31, 43),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyMusicPage()));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.cyan,
                        size: 33,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'My Music',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Color.fromARGB(255, 32, 31, 43),
                        size: 33,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 26, bottom: 10),
                child: Text(
                  'My Records',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/emptyMusic.png'),
              ),
            ),
            height: 280,
            width: 280,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 23),
            child: Text(
              'It\'s time to create your first project',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DrumPadPage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'New Project',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
