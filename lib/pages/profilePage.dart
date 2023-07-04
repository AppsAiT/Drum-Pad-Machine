import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/homePage.dart';
import 'package:drums_pad/pages/myAccount.dart';
import 'package:drums_pad/pages/searchPage.dart';
import 'package:drums_pad/services/adMob.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:drums_pad/widgets/profileRowButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    user = Auth().currentUser;
  }

  getUserData(snapshot) async {
    setState(() async {
      userData = snapshot.data!.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          getUserData(snapshot);
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: APP_NAME),
                              ),
                            );
                          },
                          child: const SizedBox(
                            height: 23,
                            width: 23,
                            child: Image(
                                image: AssetImage('Assets/icons/close.png')),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                  color: Color.fromARGB(182, 221, 219, 219),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Stack(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 100,
                                    right: 50,
                                    left: 50,
                                  ),
                                  child: SizedBox(
                                    height: 90,
                                    width: 200,
                                    child: Image(
                                      image: AssetImage(
                                        'Assets/imageShadow.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    left: 80,
                                    right: 80,
                                  ),
                                  child: SizedBox(
                                    height: 130,
                                    width: 130,
                                    child: userData?['photo'] != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: FadeInImage(
                                              placeholder: const AssetImage(
                                                'Assets/DefaultProfile.png',
                                              ),
                                              image: NetworkImage(
                                                  '${userData?['photo']}'),
                                              fit: BoxFit.fill,
                                              fadeInDuration: const Duration(
                                                  milliseconds: 300),
                                              fadeOutDuration: const Duration(
                                                  milliseconds: 300),
                                            ),
                                          )
                                        : const Image(
                                            image: AssetImage(
                                              'Assets/DefaultProfile.png',
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            userData?['name'],
                            style: const TextStyle(
                              color: Colors.cyan,
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (userData?['premium'])
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    height: 40,
                                    child: Image(
                                      image: AssetImage('Assets/Premium.png'),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Premium Member',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Expiry Date : ${DateFormat.yMMMd().add_jm().format(userData?['expiry'].toDate())}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ProfilePageButton(
                              title:
                                  'Reward Points : ${AdMobServices().rewardPoints}',
                              icon: Icons.person,
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ProfilePageButton(
                              title: 'My Account',
                              icon: Icons.person,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyAccountPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ProfilePageButton(
                              title: 'Notification',
                              icon: Icons.notifications,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchPage()));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ProfilePageButton(
                              title: 'Settings',
                              icon: Icons.settings,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchPage()));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ProfilePageButton(
                              title: 'Logout',
                              icon: Icons.logout,
                              onPressed: () {
                                Auth().signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MyHomePage(title: APP_NAME),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
