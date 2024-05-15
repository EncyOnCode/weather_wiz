import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_project/src/core/data/repo/weather_repo.dart';
import '../models/weather.dart';

class WeatherApiRepository implements WeatherRepository {
  final String apiKey = 'cd08a62987c1474481753333241505';
  static const String baseUrl = 'https://api.weatherapi.com/v1';


  @override
  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl/current.json?key=$apiKey&q=$cityName'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      return Weather(
        cityName: decodedData['location']['name'],
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
