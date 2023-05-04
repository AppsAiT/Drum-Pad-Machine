import 'package:flutter/material.dart';
import 'sideBar_row.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 300,
      color: const Color.fromARGB(255, 35, 35, 35),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 80),
              child: Container(
                height: 60,
                width: 60,
                color: Colors.cyan,
              ),
            ),
            Column(
              children: [
                SideBarRow(Icons.support_agent_rounded, 'Support'),
                SideBarRow(Icons.language, 'Language'),
                SideBarRow(Icons.info_outline_rounded, 'About'),
                SideBarRow(Icons.settings_sharp, 'Settings'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Container(
                    height: 3,
                    width: 260,
                    color: Colors.white,
                  ),
                ),
                SideBarRow(Icons.diamond_outlined, 'Upgrade Plan'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.facebook,
                              size: 38,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 40,
                          width: 40,
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
