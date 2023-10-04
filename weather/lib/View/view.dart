import 'package:flutter/material.dart';
import '../Controller/weather_controller.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherController controller;

  const WeatherScreen({super.key, required this.controller});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 40, 200),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 40, 200), Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.controller.weatherModel.cityName.isNotEmpty
                ? Column(
                    children: [
                      Image.network(
                        widget.controller.weatherModel.iconUrl,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'City: ${widget.controller.weatherModel.cityName}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Temperature: ${widget.controller.weatherModel.temperature}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  )
                : Container(),
            TextField(
              controller: cityController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text.trim();
                if (city.isNotEmpty) {
                  widget.controller.fetchWeatherData(city);
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Get Weather',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
