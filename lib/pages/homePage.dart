import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/myMusicPage.dart';
import 'package:drums_pad/pages/searchPage.dart';
import 'package:drums_pad/pages/tutorialPage.dart';
import 'package:drums_pad/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/fetch.dart';
import '../widgets/carouselContainer.dart';
import '../widgets/containerPill.dart';
import '../widgets/containers.dart';
import '../widgets/navigationButtons.dart';
import '../widgets/sideBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List Songs = [];

  // mapRecords(QuerySnapshot<Map<dynamic, dynamic>> records) {
  //   var lst = records.docs
  //       .map((product) => Data(
  //             id: product.id,
  //             title: product['title'],
  //             subtitle: product['subtitle'],
  //             image: product['img'],
  //           ))
  //       .toList();

  //   Songs = lst;
  //   setState(() {
  //     Songs = lst;
  //   });
  // }

  // fetchData() async {
  //   var records = await FirebaseFirestore.instance.collection('songs').get();
  //   mapRecords(records);
  // }
  List<QueryDocumentSnapshot<Map<String, dynamic>>> _documents = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromFirebase();
    print('----------------');
  }

  Future<void> fetchDataFromFirebase() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('songs').get();
    setState(
      () {
        _documents = snapshot.docs;
      },
    );
    print(_documents);
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              return CaroselContainer(
                                title: 'Songs_title',
                                subTitle: 'Songs_subtitle',
                                imgeUrl:
                                    'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bXVzaWN8ZW58MHx8MHx8&w=1000&q=80',
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
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            itemCount: _documents.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data =
                                  _documents[index].data();

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
