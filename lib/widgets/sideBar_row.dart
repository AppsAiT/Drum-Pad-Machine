import 'package:flutter/material.dart';

class SideBarRow extends StatelessWidget {
  final _icon;
  final String _text;

  const SideBarRow(this._icon, this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              _icon,
              color: Colors.white,
              size: 31,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                _text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
