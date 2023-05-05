import 'package:flutter/material.dart';

class CaroselContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgeUrl;

  CaroselContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgeUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 200,
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
