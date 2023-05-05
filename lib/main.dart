import 'package:flutter/material.dart';
import 'constants.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
            .copyWith(background: Colors.black),
      ),
      home: MyHomePage(title: APP_NAME),
    );
  }
}
