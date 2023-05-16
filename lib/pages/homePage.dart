// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/myMusicPage.dart';
import 'package:drums_pad/pages/searchPage.dart';
import 'package:drums_pad/pages/tutorialPage.dart';
import 'package:drums_pad/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/carouselContainer.dart';
import '../widgets/containerPill.dart';
import '../widgets/containers.dart';
import '../widgets/navigationButtons.dart';
import '../widgets/sideBar.dart';
import 'package:loading_indicator/loading_indicator.dart';

const List<Color> _kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  void requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    var status2 = await Permission.manageExternalStorage.status;
    if (!status2.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchDataFromFirebase() async {
    return FirebaseFirestore.instance.collection('songs').get();
  }

  List<IconData> listOfIcons = [
    Icons.home_filled,
    Icons.music_video,
    Icons.play_circle_outline,
  ];

  List<String> listOfStrings = [
    'Home',
    'My Music',
    'Tutorial',
  ];

  var currentIndex = 0;

  List<Widget> pages = [
    const Home(),
    const MyMusicPage(),
    const TutorialPage(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Home(),
      const MyMusicPage(),
      const TutorialPage(),
    ];

    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const SideBar(),
      body: currentIndex == 0
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: 1000,
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Trending',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          future: fetchDataFromFirebase(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: SizedBox(
                                height: 90,
                                width: 90,
                                child: LoadingIndicator(
                                  indicatorType:
                                      Indicator.lineScalePulseOutRapid,
                                  colors: _kDefaultRainbowColors,
                                  strokeWidth: 4.0,
                                  pathBackgroundColor: Colors.transparent,
                                ),
                              ));
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                      'Error occurred: ${snapshot.error}'));
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              // Handle case when no data is available
                              return const Center(
                                  child: Text('No data available'));
                            }
                            // Data is available, display it
                            final documents = snapshot.data!.docs;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CarouselSlider.builder(
                                itemCount: documents.length,
                                itemBuilder: (BuildContext context,
                                    int itemIndex, int pageViewIndex) {
                                  Map<String, dynamic> data =
                                      documents[itemIndex].data();
                                  return CaroselContainer(
                                    title: data['title'],
                                    subTitle: data['subtitle'],
                                    imgeUrl: data['img'],
                                  );
                                },
                                options: CarouselOptions(
                                  height: 200,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      const Duration(seconds: 3),
                                  viewportFraction: 0.58,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  'Genres',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                HomePagePill(Index: index),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 5, top: 10),
                                child: Text(
                                  'New Release',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          future: fetchDataFromFirebase(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Display a loading indicator while waiting for data
                              return const Center(
                                  child: SizedBox(
                                height: 90,
                                width: 90,
                                child: LoadingIndicator(
                                  indicatorType:
                                      Indicator.lineScalePulseOutRapid,
                                  colors: _kDefaultRainbowColors,
                                  strokeWidth: 4.0,
                                  pathBackgroundColor: Colors.transparent,
                                ),
                              ));
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                      'Error occurred: ${snapshot.error}'));
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                  child: Text('No data available'));
                            }
                            // Data is available, display it
                            final documents = snapshot.data!.docs;
                            return SizedBox(
                              height: 170,
                              child: ListView.builder(
                                itemCount: documents.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> data =
                                      documents[index].data();

                                  return Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: HomePageContainer(
                                      title: data['title'],
                                      subTitle: data['subtitle'],
                                      imgeUrl: data['img'],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Most Popular',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                            Builder(builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  size: 33,
                                  color: Colors.cyan,
                                ),
                              );
                            }),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchPage()));
                                },
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromARGB(255, 40, 41, 52),
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                          size: 23,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Search',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : screens[currentIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: displayWidth * .20,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 83, 83, 103),
            width: 2,
          ),
          color: const Color.fromARGB(255, 21, 22, 26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    HapticFeedback.lightImpact();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: NavigationButton(
                    index: index,
                    cindex: currentIndex,
                    buttonIcons: listOfIcons[index],
                    buttonText: listOfStrings[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
