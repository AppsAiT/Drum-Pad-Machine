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
  final bool premium;

  const HomePageContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgeUrl,
    required this.premium,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: FadeInImage(
              placeholder: const AssetImage('Assets/imageLoading.png'),
              image: NetworkImage(imgeUrl),
              fit: BoxFit.fill,
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                height: 60,
                width: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 6, 114, 128),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              subTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          child: InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  Color.fromARGB(255, 38, 108, 117),
                              child: Icon(
                                Icons.play_circle_fill_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 10),
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
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          premium
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(
                          'Assets/Premium.png',
                        ))),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
