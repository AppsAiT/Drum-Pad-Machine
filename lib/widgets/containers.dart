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
