// ignore_for_file: unused_import, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/loginCheck.dart';
import 'package:drums_pad/pages/upgradePlanPage.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../constants.dart';
import '../pages/homePage.dart';
import 'sideBar_row.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late BannerAd bannerAd;
  bool loaded = false;
  late String adUnitId = "ca-app-pub-3940256099942544/6300978111"; //testing ID
  bool isPremiumMember = false;

  void _createBannerAdd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('Ad Loaded');
          setState(() {
            loaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad Failed to Load : $error');
        },
        // onAdOpened: (ad) => print('Ad Opened'),
        // onAdClosed: (ad) => print('Ad Closed'),
      ),
    );
    bannerAd.load();
  }

  checkPremium() {
    var user = Auth().currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value) {
        if (value.data()!['premium']) {
          setState(() {
            isPremiumMember = true;
          });
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _createBannerAdd();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 300,
      color: const Color.fromARGB(255, 40, 41, 52),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 40),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('Assets/logo.png'),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'MUSIC',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.cyan,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'MAKER',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SideBarRow(Icons.support_agent_rounded, 'Support'),
                const SideBarRow(Icons.language, 'Language'),
                const SideBarRow(Icons.info_outline_rounded, 'About'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Container(
                    height: 3,
                    width: 260,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginCheckPage(
                                page: const UpgradePlanPage(),
                              )
                          // builder: (context) => const UpgradePlanPage(),
                          ),
                    );
                  },
                  child:
                      const SideBarRow(Icons.diamond_outlined, 'Upgrade Plan'),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Image(
                            image: AssetImage('Assets/facebook.png'),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Image(
                            image: AssetImage('Assets/instagram.png'),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Image(
                            image: AssetImage('Assets/linkedin.png'),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Image(
                            image: AssetImage('Assets/website.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (!isPremiumMember)
                  !(loaded)
                      ? Container()
                      : SizedBox(
                          height: bannerAd.size.height.toDouble(),
                          width: bannerAd.size.width.toDouble(),
                          child: AdWidget(ad: bannerAd),
                        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
