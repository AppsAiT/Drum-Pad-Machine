// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:async';

import 'package:drums_pad/constants.dart';
import 'package:drums_pad/pages/homePage.dart';
import 'package:drums_pad/pages/permissionPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      if (await Permission.storage.status.isGranted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: APP_NAME),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PermissionPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'Assets/splashLogo.png',
              height: 200,
              width: 200,
            ),
            const Spacer(),
            Text(
              'Powered By',
              style: TextStyle(
                color: Colors.cyan.shade200,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Text(
                'AppsAiT',
                style: GoogleFonts.notoSans(
                  fontSize: 35,
                  color: Colors.cyan.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
