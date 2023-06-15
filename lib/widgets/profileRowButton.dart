import 'package:flutter/material.dart';

class ProfilePageButton extends StatelessWidget {
  const ProfilePageButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 47,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Colors.cyan,
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    icon,
                    color: Colors.cyan,
                    size: 36,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 188, 190, 190),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 12,
              ),
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Color.fromARGB(255, 188, 190, 190),
                size: 34,
              ),
            )
          ],
        ),
      ),
    );
  }
}
