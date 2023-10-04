import 'dart:async';
import 'dart:convert';
import '../Model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherController {
  final WeatherModel weatherModel = WeatherModel();

  Future<void> fetchWeatherData(String city) async {
    try {
      String apikey = '2b9ce44e72898c8789ef8b4fe3cf755c';
      final url = Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey');
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        weatherModel.temperature =
            (((double.parse((data['main']['temp']).toString())) - 273)
                .toStringAsFixed(2));
        weatherModel.cityName = data['name'];
        weatherModel.iconUrl =
            'http://openweathermap.org/img/w/${data['weather'][0]['icon']}.png';
        weatherModel.humidity = (data['main']['humidity']).toString();
      }
    } catch (e) {
      print('e');
    }
  }
}
