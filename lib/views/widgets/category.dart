import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  static double cHeight = 250;
  static double cWidth = 350;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: SizedBox(
              height: cHeight,
              width: cWidth,
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: cHeight,
            width: cWidth,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(140, 0, 0, 0),
                  Color.fromARGB(103, 255, 255, 255)
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              // color: const Color.fromARGB(62, 47, 47, 47)
            ),
          ),
        ),
        Positioned(
          left: 24,
          bottom: 16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Car",
                style: GoogleFonts.balooPaaji2(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                )),
          ),
        )
      ],
    );
  }
}
