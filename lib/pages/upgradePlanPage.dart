// ignore_for_file: file_names

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/constants.dart';
import 'package:drums_pad/pages/homePage.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:drums_pad/widgets/planContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class UpgradePlanPage extends StatefulWidget {
  const UpgradePlanPage({super.key});

  @override
  State<UpgradePlanPage> createState() => _UpgradePlanPageState();
}

class _UpgradePlanPageState extends State<UpgradePlanPage> {
  late Map<String, dynamic> gold, diamond, platinum;
  int selectedPlan = 0;
  String? loadingstatus;
  final _razorpay = Razorpay();
  int? total;
  String? name;
  String? description;
  User? user;
  bool isPremium = false;
  List duration = [30, 180, 360];

  static const List<Color> _kDefaultRainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  getdata() async {
    var userData;
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

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      userData = value.data()!;
    });

    setState(() {
      isPremium = userData['premium'];
      loadingstatus = 'done';
    });
  }

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    user = Auth().currentUser;
    getdata();
    super.initState();
  }

  Update() async {
    print('===============> done');
    await FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
      'expiry': DateTime.now().add(Duration(days: duration[selectedPlan - 1])),
      'premium': true,
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        'Payment Success : ${response.paymentId}, ${response.orderId}, ${response.signature}');
    Update();

    // Show success dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Success'),
          content: Text(
              'Payment has been successfully completed. Payment ID: ${response.paymentId}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );
    setState(() {
      isPremium = true;
      loadingstatus = 'done';
    });

    _razorpay.clear();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error : ${response.code} --> ${response.message}');

    // Show failure dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Failure'),
          content: Text(
              'Payment has failed to complete. Error: ${response.message}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet : ${response.walletName}');

    // Show failure dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('External Wallet'),
          content: Text('External Wallet: ${response.walletName}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );

    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: loadingstatus != null
          ? isPremium
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 130,
                        width: 130,
                        child: Image(
                          image: AssetImage('Assets/Premium.png'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'You are Already Premium Member.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
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
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            padding:
                                EdgeInsets.only(top: 30, left: 10, bottom: 10),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPlan = 1;
                                  total = gold['amount'];
                                  name = 'Gold';
                                  description = '1 Month';
                                });
                              },
                              child: PlanContainer(
                                PlanText: 'Gold',
                                PlanPrice: gold['amount'].toString(),
                                PlanDuration: '1 Month',
                                image: 'goldPlan.png',
                                pageIndex: 1,
                                selection: selectedPlan,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPlan = 2;
                                  total = diamond['amount'];
                                  name = 'Diamond';
                                  description = '3 months';
                                });
                              },
                              child: PlanContainer(
                                PlanText: 'Diamond',
                                PlanPrice: diamond['amount'].toString(),
                                PlanDuration: '3 Months',
                                image: 'diamondPlan.png',
                                pageIndex: 2,
                                selection: selectedPlan,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPlan = 3;
                                  total = platinum['amount'];
                                  name = 'Platinum';
                                  description = '12 Months';
                                });
                              },
                              child: PlanContainer(
                                PlanText: 'Platinum',
                                PlanPrice: platinum['amount'].toString(),
                                PlanDuration: '12 Months',
                                image: 'platinumPlan.png',
                                pageIndex: 3,
                                selection: selectedPlan,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: InkWell(
                          onTap: () {
                            if (selectedPlan != 0) {
                              var options = {
                                'key': 'rzp_test_MYuwgd89Hh4FwO',
                                'amount': total! * 100,
                                'name': name,
                                'description': description,
                                'prefill': {
                                  'contact': '8309365005',
                                  'email': 'vikram.nitpy@gmail.com'
                                }
                              };

                              try {
                                _razorpay.open(options);
                              } catch (error) {
                                print('====================> Error : $error');
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Select any Plan'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
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
                  ),
                )
          : const Center(
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
            ),
    );
  }
}
