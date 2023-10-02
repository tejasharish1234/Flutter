import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Routines extends StatelessWidget {
  const Routines({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 90,
          width: 90,
          color: const Color.fromARGB(255, 202, 141, 28),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.sunny),
                Text("Sunny", style: GoogleFonts.robotoSlab(fontSize: 16)),
              ]),
        ));
  }
}
