// ignore_for_file: file_names

import 'package:drums_pad/pages/homePage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 90,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: 'title'),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 33,
                          color: Colors.cyan,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width - 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 41, 52),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 12, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 18,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
