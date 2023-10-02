import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, required this.str1});

  final String str1;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Text(
      str1,
      style: GoogleFonts.robotoSlab(
          fontSize: 16,
          backgroundColor: const Color.fromARGB(255, 202, 141, 28)),
    ));
  }
}
