// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/genreSongList.dart';
import 'package:drums_pad/pages/loginCheck.dart';
import 'package:drums_pad/pages/loginPage.dart';
import 'package:drums_pad/pages/myMusicPage.dart';
import 'package:drums_pad/pages/searchPage.dart';
import 'package:drums_pad/pages/tutorialPage.dart';
import 'package:drums_pad/pages/upgradePlanPage.dart';
import 'package:drums_pad/services/adMob.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:drums_pad/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/carouselContainer.dart';
import '../widgets/containerPill.dart';
import '../widgets/navigationButtons.dart';
import '../widgets/sideBar.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'drumpadScreen.dart';

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
  late AudioPlayer homeAudioPlayer, homeAudioPlayer2;
  late final RewardedAd rewardedAd;
  final String adUnitId = "ca-app-pub-3940256099942544/6300978111"; //testing ID
  late BannerAd _bannerAd;
  bool _bannerIsLoaded = false, isPremium = false;
  var points = 0;
  bool isPremiumMember = false;

  @override
  void initState() {
    requestPermission();
    checkSubscription();
    // _loadRewardedAd();
    _createBannerAdd();
    checkPremium();
    homeAudioPlayer = AudioPlayer();
    homeAudioPlayer2 = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    homeAudioPlayer.dispose();
    homeAudioPlayer2.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  void _createBannerAdd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('Ad Loaded');
          setState(() {
            _bannerIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad Failed to Load : $error');
        },
        // onAdOpened: (ad) => print('Ad Opened'),
        // onAdClosed: (ad) => print('Ad Closed'),
      ),
    );
    _bannerAd.load();
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded');
          rewardedAd = ad;
          _setFullScreenContentCallBack();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Error : $error');
        },
      ),
    );
  }

  void _setFullScreenContentCallBack() {
    if (rewardedAd == null) return;
    rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('$ad onAdShowedFullScreenContent'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent');
        ad.dispose();
        _loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowedFullScreenContent Error : $error');
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) => print('$ad ImpressionOccured'),
    );
  }

  void _showAd() {
    var user = Auth().currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      points = value.data()!['rewardPoints'] ?? 0;
    });
    rewardedAd.show(onUserEarnedReward: (ad, rewardItem) {
      points = points + rewardItem.amount.toInt();
      print('=================> Reward points : ${points}');
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'rewardPoints': points,
      });
    });
  }

  checkPremium() {
    var user = Auth().currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value) {
        if (value.data()!['premium']) {
          setState(() {
            isPremiumMember = true;
          });
        }
      });
    }
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
    return FirebaseFirestore.instance.collection('Songs').get();
  }

  checkSubscription() async {
    var user = Auth().currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((value) {
          if (value.data()!['premium'] == true) {
            isPremium = true;
            var date = value.data()!['expiry'].toDate().toUtc();
            if (!DateTime.now().toUtc().isBefore(date)) {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .update({
                'expiry': DateTime.now(),
                'premium': false,
              });
            }
          }
        });
      } catch (e) {
        print('==================> $e');
      }
    }
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
    Home(),
    const MyMusicPage(),
    LoginPage(pageKey: 1),
  ];

  check(data) {
    var user = Auth().currentUser;
    if (user != null) {
      if (data['premium']) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((value) {
          if (value.data()!['premium']) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrumPadPage(link: data['songUrl']),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpgradePlanPage()),
            );
          }
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DrumPadPage(
              link: data['songUrl'],
            ),
          ),
        );
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(pageKey: 1)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(),
      const MyMusicPage(),
      LoginCheckPage(page: const TutorialPage()),
      // const TutorialPage(),
    ];

    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: SideBar(),
      body: currentIndex == 0
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: 900,
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
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
                            final trendingSongs = documents.where((song) {
                              return song['trending'] == 'Yes';
                            }).toList();
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                height: 190,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: trendingSongs.length,
                                  itemBuilder:
                                      (BuildContext context, int itemIndex) {
                                    if (trendingSongs.isNotEmpty) {
                                      Map<String, dynamic> data =
                                          trendingSongs[itemIndex].data();
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: InkWell(
                                          onTap: () {
                                            check(data);
                                          },
                                          child: CaroselContainer(
                                            title: data['title'],
                                            subTitle: data['subTitle'],
                                            imgeUrl: data['imgUrl'],
                                            premium: data['premium'],
                                            song: data['songUrl'],
                                            audioPlayer: homeAudioPlayer,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: Text(
                                          'No data available',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }
                                  },
                                  // options: CarouselOptions(
                                  //   height: 200,
                                  //   enlargeCenterPage: false,
                                  //   // autoPlay: true,
                                  //   aspectRatio: 16 / 9,
                                  //   autoPlayCurve: Curves.fastOutSlowIn,
                                  //   enableInfiniteScroll: false,
                                  //   // autoPlayAnimationDuration:
                                  //   //     const Duration(seconds: 3),
                                  //   viewportFraction: 0.60,
                                  //   scrollDirection: Axis.horizontal,
                                  // ),
                                ),
                              ),
                            );
                          },
                        ),
                        if (!isPremiumMember)
                          (_bannerIsLoaded)
                              ? SizedBox(
                                  height: _bannerAd.size.height.toDouble(),
                                  width: _bannerAd.size.width.toDouble(),
                                  child: AdWidget(ad: _bannerAd),
                                )
                              : const SizedBox(),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: InkWell(
                                    onTap: _showAd,
                                    child: const Text(
                                      'Genres',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SongListGenre()));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'View All',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            itemCount: 7,
                            itemBuilder: (context, index) =>
                                HomePagePill(Index: index),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
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
                            List documents = snapshot.data!.docs;
                            documents.shuffle();
                            return SizedBox(
                              height: 190,
                              child: ListView.builder(
                                itemCount: 15,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> data =
                                      documents[index].data();
                                  return Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: InkWell(
                                      onTap: () {
                                        check(data);
                                      },
                                      child: CaroselContainer(
                                        title: data['title'],
                                        subTitle: data['subTitle'],
                                        imgeUrl: data['imgUrl'],
                                        premium: data['premium'],
                                        song: data['songUrl'],
                                        audioPlayer: homeAudioPlayer2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        // const Padding(
                        //   padding: EdgeInsets.all(12),
                        //   child: Row(
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 10),
                        //         child: Text(
                        //           'Most Popular',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 23,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                                  child: const Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
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
