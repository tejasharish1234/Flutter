import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromARGB(255, 202, 141, 28)),
      width: 250,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                disp("22", "Avg House Temp"),
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
                disp("30", "Outside Temp")
              ]),
          const Divider(thickness: 1, color: Colors.black),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                disp("60 %", "Humidity"),
                const SizedBox(width: 50),
                disp("3", "Devices")
              ])
        ],
      ),
    );
  }

  Widget disp(String str1, String str2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(str1, style: GoogleFonts.robotoFlex(fontSize: 18)),
        Text(str2, style: GoogleFonts.robotoSlab(fontSize: 15))
      ],
    );
  }
}
