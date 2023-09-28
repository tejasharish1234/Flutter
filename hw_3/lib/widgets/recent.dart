import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0), color: Colors.amber),
      child: const Icon(Icons.tv),
    );
  }
}
