// ignore_for_file: file_names, must_be_immutable

import 'package:drums_pad/services/musicPlay.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:rxdart/rxdart.dart';

class CaroselContainer extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imgeUrl;
  final bool premium;
  final String song;
  late AudioPlayer audioPlayer;

  CaroselContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgeUrl,
    required this.premium,
    required this.song,
    required this.audioPlayer,
  });

  @override
  State<CaroselContainer> createState() => _CaroselContainerState();
}

class _CaroselContainerState extends State<CaroselContainer> {
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        widget.audioPlayer.positionStream,
        widget.audioPlayer.bufferedPositionStream,
        widget.audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );
  @override
  void initState() {
    super.initState();
    widget.audioPlayer = AudioPlayer()
      ..setAudioSource(LockCachingAudioSource(Uri.parse(widget.song)));
  }

  @override
  Widget build(BuildContext context) {
    // void play() {
    //   if (icon == Icons.play_circle_fill_outlined) {
    //     setState(() {
    //       icon = Icons.pause_circle_filled_outlined;
    //       widget.audioPlayer.stop();
    //       widget.audioPlayer.play();
    //     });
    //   } else {
    //     setState(() {
    //       widget.audioPlayer.stop();
    //       icon = Icons.play_circle_fill_outlined;
    //     });
    //   }
    // }

    return StreamBuilder(
        stream: widget.audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final isplaying = playerState?.playing;
          return Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 220,
                  child: Stack(children: [
                    SizedBox(
                      width: 220,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder:
                              const AssetImage('Assets/imageLoading.png'),
                          image: NetworkImage(widget.imgeUrl),
                          fit: BoxFit.fill,
                          fadeInDuration: const Duration(milliseconds: 300),
                          fadeOutDuration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ),
                    ((isplaying ?? false))
                        ? Container(
                            height: 150,
                            color: const Color.fromARGB(127, 0, 0, 0),
                            child: const Center(
                              child: SizedBox(
                                width: 90,
                                child: MiniMusicVisualizer(
                                  color: Colors.cyan,
                                  width: 15,
                                  height: 50,
                                ),
                              ),
                              // child: ProgressBar(
                              //   progress:
                              //       positionData?.position ?? Duration.zero,
                              //   buffered: positionData?.bufferedPosition ??
                              //       Duration.zero,
                              //   total:
                              //       positionData?.duration ?? Duration.zero,
                              //   progressBarColor: Colors.red,
                              //   baseBarColor:
                              //       Colors.white.withOpacity(0.24),
                              //   bufferedBarColor:
                              //       Colors.white.withOpacity(0.24),
                              //   thumbColor: Colors.white,
                              //   barHeight: 3.0,
                              //   thumbRadius: 5.0,
                              // ),
                            ),
                          )
                        : Container(),
                  ]),
                ),
                Column(
                  children: [
                    const Spacer(),
                    Container(
                      height: 60,
                      width: 220,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Color.fromARGB(255, 6, 114, 128),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    widget.subTitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // const Spacer(),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(right: 2, left: 2),
                                  child: !(isplaying ?? false)
                                      ? InkWell(
                                          onTap: widget.audioPlayer.play,
                                          child: const CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Color.fromARGB(
                                                255, 6, 114, 128),
                                            child: Icon(
                                              Icons.play_circle_fill_rounded,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            widget.audioPlayer.stop();
                                            widget.audioPlayer
                                                .seek(Duration.zero);
                                          },
                                          child: const CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Color.fromARGB(
                                                255, 6, 114, 128),
                                            child: Icon(
                                              Icons.stop_circle_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: InkWell(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Color.fromARGB(255, 6, 114, 128),
                                    child: Icon(
                                      Icons.more_vert_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                widget.premium
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage(
                                'Assets/Premium.png',
                              ))),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        });
  }
}
