import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: "Wallpaper X",
              style: TextStyle(
                  color: Color.fromARGB(255, 34, 34, 34),
                  fontSize: 20,
                  fontWeight: FontWeight.w600))
        ]),
      ),
    );
  }
}
