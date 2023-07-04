import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/services/auth.dart';
import 'package:flutter/material.dart';

class PremiumCheck extends StatelessWidget {
  const PremiumCheck({super.key});

  check() {
    var user = Auth().currentUser;
    if (user != null) {
      FirebaseFirestore.instance.doc(user.uid).get().then((value) {
        if (value.data()!['premium'] == true) {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
