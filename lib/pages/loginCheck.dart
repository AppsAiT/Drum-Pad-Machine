import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/errorPage.dart';
import 'package:drums_pad/pages/loginPage.dart';
import 'package:drums_pad/pages/tutorialPage.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginCheckPage extends StatefulWidget {
  LoginCheckPage({
    super.key,
    required this.page,
  });

  Widget page;

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

  Timer? timer;

  void signOut() async {
    await Auth().signOut();
  }

  void sendVerification() async {
    try {
      final user = Auth().currentUser;
      await user?.sendEmailVerification();
      var snack = const SnackBar(content: Text('Sending verification email'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } catch (e) {
      var snack = SnackBar(content: Text('Error : $e'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkverified() async {
    User? user = Auth().currentUser!;
    await user.reload();
    setState(() {
      bool isVerified = user.emailVerified;
      if (isVerified) {
        timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => widget.page,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User? user = Auth().currentUser;
          bool isVerified = user!.emailVerified;
          if (!isVerified) {
            timer = Timer.periodic(
              const Duration(seconds: 5),
              (_) => checkverified(),
            );
            return ErrorPage(
              buttonMessage: 'Sign Out',
              message: 'Account Not Verified',
              email: user.email!,
              onPressed: () {
                signOut();
              },
              retry: () {
                sendVerification();
              },
              retryMessage: 'Resend email',
            );
          } else {
            return widget.page;
          }
        } else if (!snapshot.hasData) {
          return LoginPage(pageKey: 1);
        } else {
          return const Center(
            child: SizedBox(
              height: 90,
              width: 90,
              child: LoadingIndicator(
                indicatorType: Indicator.lineScalePulseOutRapid,
                colors: _kDefaultRainbowColors,
                strokeWidth: 4.0,
                pathBackgroundColor: Colors.transparent,
              ),
            ),
          );
        }
      },
    );
  }
}
