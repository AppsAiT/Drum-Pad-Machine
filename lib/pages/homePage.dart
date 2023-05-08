import 'package:carousel_slider/carousel_slider.dart';
import 'package:drums_pad/navigator.dart';
import 'package:drums_pad/pages/searchPage.dart';
import 'package:drums_pad/widgets/containers.dart';
import 'package:flutter/material.dart';
import '../widgets/carouselContainer.dart';
import '../widgets/containerPill.dart';
import '../widgets/sideBar.dart';
import '/nav1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.home_outlined,
    Icons.search,
    Icons.add_box_outlined,
    Icons.favorite_outline_sharp,
    Icons.person_outline_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: Builder(
      //     builder: (context) {
      //       return Padding(
      //         padding: const EdgeInsets.only(left: 15),
      //         child: IconButton(
      //           onPressed: () {
      //             Scaffold.of(context).openDrawer();
      //           },
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //           icon: const Icon(
      //             Icons.menu,
      //             size: 33,
      //             color: Colors.cyan,
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      // bottomNavigationBar: BottomNavyBar(
      //   backgroundColor: Colors.black,
      //   selectedIndex: 0,
      //   showElevation: true,
      //   itemCornerRadius: 24,
      //   curve: Curves.easeIn,
      //   onItemSelected: (index) => setState(
      //     () {
      //       _currentIndex = index;
      //       _pageController.animateToPage(index,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.easeIn);
      //     },
      //   ),
      //   items: [
      //     BottomNavyBarItem(
      //       icon: const Icon(Icons.home),
      //       title: const Text('Home'),
      //       activeColor: Colors.cyan,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: const Icon(Icons.search),
      //       title: const Text('Search'),
      //       activeColor: Colors.cyan,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: const Icon(Icons.menu_book),
      //       title: const Text('Tutorial'),
      //       activeColor: Colors.cyan,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: const Icon(Icons.music_note),
      //       title: const Text('My Music'),
      //       activeColor: Colors.cyan,
      //       textAlign: TextAlign.center,
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 1000,
              color: Colors.black,
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 32, left: 15),
                  //   child: Row(
                  //     children: [
                  //       Builder(builder: (context) {
                  //         return IconButton(
                  //           onPressed: () {
                  //             Scaffold.of(context).openDrawer();
                  //           },
                  //           icon: const Icon(
                  //             Icons.menu,
                  //             size: 33,
                  //             color: Colors.cyan,
                  //           ),
                  //         );
                  //       }),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 18),
                  //         child: Container(
                  //           height: 40,
                  //           width: MediaQuery.of(context).size.width - 110,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: const Color.fromARGB(255, 40, 41, 52),
                  //           ),
                  //           child: Center(
                  //               child: Padding(
                  //             padding: const EdgeInsets.all(10),
                  //             child: Row(
                  //               children: const [
                  //                 Icon(
                  //                   Icons.search,
                  //                   color: Colors.grey,
                  //                   size: 23,
                  //                 ),
                  //                 SizedBox(width: 5),
                  //                 Text(
                  //                   'Search',
                  //                   style: TextStyle(
                  //                     color: Colors.grey,
                  //                     fontSize: 16,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           )),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  // CaroselContainer(
                  //   title: 'Serpent King',
                  //   subTitle: 'Serpent King',
                  //   imgeUrl:
                  //       'https://t3.ftcdn.net/jpg/04/79/81/76/360_F_479817672_BpTyGX9qAl3rs9mHqvQUsyWXTJrkLUII.jpg',
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CarouselSlider.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          CaroselContainer(
                        title: 'Serpent King',
                        subTitle: 'Serpent King',
                        imgeUrl:
                            'https://t3.ftcdn.net/jpg/04/79/81/76/360_F_479817672_BpTyGX9qAl3rs9mHqvQUsyWXTJrkLUII.jpg',
                      ),
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(seconds: 3),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  // ListView.builder(
                  //   itemBuilder: (context, i) => const HomePagePill(),
                  //   itemCount: 5,
                  // ),
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
                          padding:
                              EdgeInsets.only(left: 10, bottom: 5, top: 10),
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
                  Container(
                    height: 170,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(6),
                        child: HomePageContainer(
                          title: 'title ${index + 1}',
                          subTitle: 'subTitle ${index + 1}',
                          imgeUrl:
                              'https://t3.ftcdn.net/jpg/04/79/81/76/360_F_479817672_BpTyGX9qAl3rs9mHqvQUsyWXTJrkLUII.jpg',
                        ),
                      ),
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
                  // HomePageContainer(
                  //   title: 'title',
                  //   subTitle: 'subTitle',
                  //   imgeUrl:
                  //       'https://t3.ftcdn.net/jpg/04/79/81/76/360_F_479817672_BpTyGX9qAl3rs9mHqvQUsyWXTJrkLUII.jpg',
                  // )
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
                                    builder: (context) => const SearchPage()));
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 40, 41, 52),
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
          ),

          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: Material(
          //     elevation: 10,
          //     borderRadius: BorderRadius.circular(20),
          //     color: Colors.black,
          //     child: Container(
          //       height: 70,
          //       width: double.infinity,
          //       child: ListView.builder(
          //         itemCount: data.length,
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         itemBuilder: (ctx, i) => Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 15),
          //           child: GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 selectedIndex = i;
          //               });
          //             },
          //             child: AnimatedContainer(
          //               duration: Duration(milliseconds: 250),
          //               width: 35,
          //               decoration: BoxDecoration(
          //                 border: i == selectedIndex
          //                     ? Border(
          //                         top: BorderSide(
          //                             width: 3.0, color: Colors.white))
          //                     : null,
          //                 gradient: i == selectedIndex
          //                     ? LinearGradient(
          //                         colors: [Colors.grey.shade800, Colors.black],
          //                         begin: Alignment.topCenter,
          //                         end: Alignment.bottomCenter)
          //                     : null,
          //               ),
          //               child: Icon(
          //                 data[i],
          //                 size: 35,
          //                 color: i == selectedIndex
          //                     ? Colors.white
          //                     : Colors.grey.shade800,
          //               ),
          //             ),
          //           ),
          //         ),
          //         scrollDirection: Axis.horizontal,
          //       ),
          //     ),
          //   ),
          // ),

          Column(
            children: const [
              SizedBox(height: 650),
              NaviBar(),
            ],
          ),
        ],
      ),
    );
  }
}
