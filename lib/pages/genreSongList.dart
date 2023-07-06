import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/services/musicPlay.dart';
import 'package:drums_pad/widgets/genreRowElements.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:rxdart/rxdart.dart';

import '../constants.dart';
import 'homePage.dart';

class SongListGenre extends StatelessWidget {
  SongListGenre({super.key});

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
                                builder: (context) =>
                                    MyHomePage(title: APP_NAME)));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.cyan,
                        size: 33,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Hip Hop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Color.fromARGB(255, 32, 31, 43),
                      size: 33,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 220,
                  child: Image(
                    image: AssetImage('Assets/genres/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Songs').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs;
                    final filteredSongs = data.where((song) {
                      return song['genre'] == 'Hip Hop';
                    }).toList();
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: filteredSongs.length,
                      itemBuilder: (context, index) {
                        if (filteredSongs.isNotEmpty) {
                          Map<String, dynamic> data =
                              filteredSongs[index].data();
                          return GenreRowElements(data: data);
                        } else {
                          return const Center(
                            child: Text(
                              'No data available',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      )),
    );
  }
}
