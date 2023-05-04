import 'package:carousel_slider/carousel_slider.dart';
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
              icon: Icon(
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
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: CarouselSlider.builder(
              itemCount: 10,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      const CaroselContainer(),
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
