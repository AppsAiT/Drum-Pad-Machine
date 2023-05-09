import 'package:drums_pad/navigator.dart';
import 'package:drums_pad/pages/ex.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'nav.dart';
import 'pages/ex2.dart';
import 'pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
            .copyWith(background: Colors.black),
      ),
      // home: Example2(),
      home: MyHomePage(title: APP_NAME),
    );
  }
}
