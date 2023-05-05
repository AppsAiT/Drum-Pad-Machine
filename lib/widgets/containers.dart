import 'package:flutter/material.dart';

class ContainerWithLable extends StatelessWidget {
  const ContainerWithLable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/facebook-app-icon.png',
            fit: BoxFit.cover,
          ),
          Container()
          // Positioned(
          //   bottom: -1,
          //   left: -1,
          //   right: -1,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       border: Border.all(
          //         color: Colors.black12,
          //         width: 1,
          //       ),
          //     ),
          //     clipBehavior: Clip.hardEdge,
          //     child: Container(
          //       color: Colors.black.withOpacity(0.5),
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          //       child: Flex(
          //         direction: Axis.vertical,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text('Title', style: TextStyle(color: Colors.black)),
          //           const SizedBox(height: 8),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned.fill(
          //   child: Material(
          //     child:
          //         InkWell(splashFactory: InkRipple.splashFactory, onTap: () {}),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// Home Page Container

class HomePageContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgeUrl;

  const HomePageContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgeUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  imgeUrl,
                ),
                fit: BoxFit.cover,
              )),
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
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.play_circle_fill_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.download_for_offline_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ]),
    );
  }
}
