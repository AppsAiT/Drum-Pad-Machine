// ignore_for_file: unused_import, file_names

import 'package:drums_pad/pages/loginCheck.dart';
import 'package:drums_pad/pages/upgradePlanPage.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../pages/homePage.dart';
import 'sideBar_row.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/LOGO.png'),
                  ),
                ),
                height: 150,
                width: 150,
              ),
            ),
            Column(
              children: [
                const SideBarRow(Icons.support_agent_rounded, 'Support'),
                const SideBarRow(Icons.language, 'Language'),
                const SideBarRow(Icons.info_outline_rounded, 'About'),
                const SideBarRow(Icons.settings_sharp, 'Settings'),
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
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.facebook,
                              size: 25,
                            )),
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
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
