import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: const Color.fromARGB(255, 202, 141, 28)),
            child: const Icon(Icons.tv)));
  }
}
