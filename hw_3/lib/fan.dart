import 'package:flutter/material.dart';

class MyFan extends StatelessWidget {
  const MyFan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
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
    return const Scaffold();
  }
}