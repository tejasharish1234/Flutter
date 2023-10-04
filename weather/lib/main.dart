import 'View/view.dart';
import 'package:flutter/material.dart';
import 'Controller/weather_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController();
    return MaterialApp(
      title: 'OpenWeatherAPI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: WeatherScreen(controller: controller),
    );
  }
}
