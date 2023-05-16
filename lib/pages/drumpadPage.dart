import 'package:drums_pad/widgets/drumPad.dart';
import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class DrumPadPage extends StatefulWidget {
  const DrumPadPage({super.key});

  @override
  State<DrumPadPage> createState() => _DrumPadPageState();
}

class _DrumPadPageState extends State<DrumPadPage> {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color:
                                        const Color.fromARGB(255, 98, 98, 98),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'B',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Side',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
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
                          min: 0,
                          max: 100,
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
            child: FullDrumPad(),
          ),
        ],
      )),
    );
  }
}
