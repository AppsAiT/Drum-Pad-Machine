import 'package:drums_pad/pages/loginPage.dart';
import 'package:drums_pad/pages/tutorialPage.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginCheckPage extends StatefulWidget {
  LoginCheckPage({
    super.key,
    required this.page,
  });

  var page;

  @override
  State<LoginCheckPage> createState() => _LoginCheckPageState();
}

class _LoginCheckPageState extends State<LoginCheckPage> {
  static const List<Color> _kDefaultRainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.page;
        } else {
          return LoginPage(pageKey: 1);
        }
      },
    );
  }
}
