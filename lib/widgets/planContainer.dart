// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

class PlanContainer extends StatelessWidget {
  String PlanText;
  String PlanPrice;
  String PlanDuration;
  String image;
  int selection;
  int pageIndex;

  PlanContainer({
    super.key,
    required this.PlanText,
    required this.PlanPrice,
    required this.PlanDuration,
    required this.image,
    required this.selection,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 110,
      decoration: BoxDecoration(
        border: selection == pageIndex
            ? Border.all(width: 3, color: Colors.cyan)
            : null,
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 41, 40, 51),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              PlanText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 10),
            child: SizedBox(
              height: 45,
              width: 45,
              child: Image.asset('Assets/icons/$image'),
            ),
          ),
          Text(
            '\$ $PlanPrice',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            PlanDuration,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
