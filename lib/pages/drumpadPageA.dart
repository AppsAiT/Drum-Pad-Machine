// ignore_for_file: unused_field, prefer_final_fields, file_names

import 'package:drums_pad/widgets/drumPad.dart';
import 'package:drums_pad/widgets/flipButton.dart';
import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class DrumPadPageA extends StatefulWidget {
  const DrumPadPageA({super.key, required this.onFlip});
  final VoidCallback? onFlip;

  @override
  State<DrumPadPageA> createState() => _DrumPadPageAState();
}

class _DrumPadPageAState extends State<DrumPadPageA> {
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;

  @override
  void initState() {
    super.initState();
    // Listen to system volume change
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

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
                    FlipButton(
                      onFlip: widget.onFlip,
                      P: 'A',
                    ),
                    const Spacer(),
                    const Text(
                      'Dubstep Club',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.arrow_circle_down_outlined,
                        color: Colors.cyan,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 32, 31, 43),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.settings_backup_restore_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          '123 BPM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 140,
                        child: Slider.adaptive(
                          onChanged: (double value) {
                            setState(() {
                              _setVolumeValue = value;
                              VolumeController().setVolume(_setVolumeValue);
                            });
                          },
                          value: _setVolumeValue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.emergency_recording_rounded,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '00:00:00',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: FullDrumPadA(),
          ),
        ],
      )),
    );
  }
}
