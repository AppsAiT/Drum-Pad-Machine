import 'package:flutter/material.dart';

class PadType1 extends StatelessWidget {
  const PadType1({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          // width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 189, 248, 251),
                  Color.fromARGB(255, 10, 188, 185),
                ],
              )),
        ),
      ),
    );
  }
}

class PadType2 extends StatelessWidget {
  const PadType2({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          // width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 249, 215, 249),
                  Color.fromARGB(255, 197, 4, 227)
                ],
              )),
        ),
      ),
    );
  }
}

class PadType3 extends StatelessWidget {
  const PadType3({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          // width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 251, 254, 221),
                  Color.fromARGB(255, 205, 227, 4),
                ],
              )),
        ),
      ),
    );
  }
}

class PadType4 extends StatelessWidget {
  const PadType4({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          // width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 238, 211, 250),
                  Color.fromARGB(255, 160, 4, 227),
                ],
              )),
        ),
      ),
    );
  }
}

class PadType5 extends StatelessWidget {
  const PadType5({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          // width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 200, 244, 196),
                  Color.fromARGB(255, 80, 240, 65),
                ],
              )),
        ),
      ),
    );
  }
}

class PadType6 extends StatelessWidget {
  const PadType6({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Container(
          // width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 200, 244, 196),
                  Color.fromARGB(255, 80, 240, 65),
                ],
              )),
        ),
      ),
    );
  }
}
