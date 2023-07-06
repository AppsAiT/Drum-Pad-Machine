import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/splashScreen.dart';
import 'package:drums_pad/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // var testDevices = ['84924d7d-5ad8-444b-80f0-b870ac22c827'];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  await FirebaseApi().initNotifications();

  // RequestConfiguration requestConfiguration =
  //     RequestConfiguration(testDeviceIds: testDevices);
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
      home: const SplashScreen(),
      // home: const DemoDrumPage(),
      // home: LoginPage(pageKey: 1),
    );
  }
}



// ==================================================================================
// ============================= FIREBASE TESTING ===================================
// ==================================================================================

// import 'dart:ui' show ImageFilter;
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   // Get collection names
//   List<String> collectionNames = await getCollectionNames();

//   // Print collection names
//   print('Collections in Firestore:');
//   for (String collectionName in collectionNames) {
//     print(collectionName);
//   }
// }

// Future<List<String>> getCollectionNames() async {
//   List<String> collectionNames = [];

//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('songs').get();

//   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
//     collectionNames.add(documentSnapshot.id);
//   }

//   return collectionNames;
// }
