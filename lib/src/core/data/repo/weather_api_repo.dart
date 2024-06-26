import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_project/src/core/data/repo/weather_repo.dart';
import '../models/weather.dart';
import 'api_key.dart';

class WeatherApiRepository implements WeatherRepository {
  final String apiKey = yourApiKey;
  static const String baseUrl = 'https://api.weatherapi.com/v1';


  @override
  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl/current.json?key=$apiKey&q=$cityName'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      return Weather(
        cityName: decodedData['location']['name'].toString(),
        temperature: decodedData['current']['temp_c'].toDouble(),
        condition: decodedData['current']['condition']['text'],
        icon: decodedData['current']['condition']['icon'].toString(),
        windSpeed: decodedData['current']['wind_kph'].toDouble(),
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
