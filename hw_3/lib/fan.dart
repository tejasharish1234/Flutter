import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/display.dart';
import 'widgets/card.dart';
import 'widgets/routines.dart';
import 'widgets/recent.dart';

class MyFan extends StatelessWidget {
  const MyFan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
      title: 'Fan',
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyFanState();
}

class _MyFanState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
              colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 44, 41, 41)
          ])),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text("My House",
              style: GoogleFonts.robotoSlab(color: Colors.amber, fontSize: 26)),
          const SizedBox(height: 20),
          const DisplayWidget(),
          const SizedBox(height: 20),
          Text("Room",
              style: GoogleFonts.robotoSlab(color: Colors.amber, fontSize: 18)),
          const SizedBox(height: 20),
          const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Cards(str1: "Living Room"), Cards(str1: "Kids Room")]),
          const SizedBox(height: 20),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Cards(str1: "Kitchen"),
            Cards(str1: "Master Bedroom")
          ]),
          const SizedBox(height: 20),
          Text("Routine",
              style: GoogleFonts.robotoSlab(color: Colors.amber, fontSize: 18)),
          const SizedBox(height: 20),
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(10, (index) => const Routines()))),
          const SizedBox(height: 20),
          Text("Recently Used",
              style: GoogleFonts.robotoSlab(color: Colors.amber, fontSize: 18)),
          const SizedBox(height: 20),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(children: List.generate(5, (index) => const Recents())),
          ),
        ],
      ),
    ));
  }
}
