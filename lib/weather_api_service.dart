import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_project/api_key.dart';

class WeatherApi {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String apiKey = yourApiKey;

  Future<Map<String, Object?>> fetchWeather(String city) async {
    var url = '$baseUrl/current.json?key=$apiKey&q=$city';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
