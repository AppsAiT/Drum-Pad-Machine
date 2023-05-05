import 'package:flutter/material.dart';

import '../widgets/carouselContainer.dart';
import '../widgets/sideBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          },
        ),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CaroselContainer(
            title: 'Serpent King',
            subTitle: 'Serpent King',
            imgeUrl:
                'https://t3.ftcdn.net/jpg/04/79/81/76/360_F_479817672_BpTyGX9qAl3rs9mHqvQUsyWXTJrkLUII.jpg',
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, bottom: 15),
          //   child: CarouselSlider.builder(
          //     itemCount: 10,
          //     itemBuilder:
          //         (BuildContext context, int itemIndex, int pageViewIndex) =>
          //             const CaroselContainer(),
          //     options: CarouselOptions(
          //       height: 180,
          //       enlargeCenterPage: true,
          //       autoPlay: false,
          //       aspectRatio: 16 / 9,
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enableInfiniteScroll: true,
          //       autoPlayAnimationDuration: const Duration(seconds: 3),
          //       viewportFraction: 0.8,
          //       scrollDirection: Axis.horizontal,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
