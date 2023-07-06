import 'package:drums_pad/pages/drumpadScreen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

class GenreRowElements extends StatefulWidget {
  const GenreRowElements({super.key, required this.data});
  final Map<String, dynamic>? data;

  @override
  State<GenreRowElements> createState() => _GenreRowElementsState();
}

class _GenreRowElementsState extends State<GenreRowElements> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    audioPlayer = AudioPlayer()
      ..setAudioSource(
          LockCachingAudioSource(Uri.parse(widget.data?['songUrl'])));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final playerState = snapshot.data;
            final isplaying = playerState?.playing;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 32, 31, 43),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DrumPadPage(
                                    link: widget.data?['songUrl'])));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image(
                              image: NetworkImage(widget.data?['imgUrl']),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data?['title'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                widget.data?['subTitle'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    (isplaying ?? false)
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 35,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: SizedBox(
                                      width: 28,
                                      child: MiniMusicVisualizer(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: () {
                                    audioPlayer.stop();
                                  },
                                  child: const Icon(
                                    Icons.stop_circle_rounded,
                                    color: Colors.white,
                                    size: 33,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                audioPlayer.seek(Duration.zero);
                                audioPlayer.play();
                              },
                              child: const Icon(
                                Icons.play_circle_fill_outlined,
                                color: Colors.white,
                                size: 33,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
