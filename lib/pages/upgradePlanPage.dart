// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/constants.dart';
import 'package:drums_pad/pages/homePage.dart';
import 'package:drums_pad/widgets/planContainer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UpgradePlanPage extends StatefulWidget {
  const UpgradePlanPage({super.key});

  @override
  State<UpgradePlanPage> createState() => _UpgradePlanPageState();
}

class _UpgradePlanPageState extends State<UpgradePlanPage> {
  late Map<String, dynamic> gold, diamond, platinum;

  getdata() async {
    await FirebaseFirestore.instance
        .collection('membership')
        .doc('Gold')
        .get()
        .then((value) {
      gold = value.data()!;
    });
    await FirebaseFirestore.instance
        .collection('membership')
        .doc('Diamond')
        .get()
        .then((value) {
      diamond = value.data()!;
    });
    await FirebaseFirestore.instance
        .collection('membership')
        .doc('Platinum')
        .get()
        .then((value) {
      platinum = value.data()!;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 32, 31, 43),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: APP_NAME)));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.cyan,
                        size: 33,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Upgrade Plan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Color.fromARGB(255, 32, 31, 43),
                        size: 33,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage('Assets/Premium.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 10, bottom: 10),
                child: Text(
                  'Premium membership',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'No ads, unlimited sounds and new',
              style: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 5),
            child: Text(
              'pack updates every week',
              style: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              height: 250,
              width: 250,
              child: Image(
                image: AssetImage('Assets/upgrade.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                PlanContainer(
                  PlanText: 'Gold',
                  PlanPrice: gold['amount'],
                  PlanIcon: gold['image'],
                  PlanDuration: 'Monthly',
                ),
                const Spacer(),
                PlanContainer(
                  PlanText: 'Diamond',
                  PlanPrice: diamond['amount'],
                  PlanIcon: diamond['image'],
                  PlanDuration: 'Monthly',
                ),
                const Spacer(),
                PlanContainer(
                  PlanText: 'Platinum',
                  PlanPrice: platinum['amount'],
                  PlanIcon: platinum['image'],
                  PlanDuration: 'Monthly',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Upgrade',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: APP_NAME)));
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
