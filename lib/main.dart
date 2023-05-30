import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
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
