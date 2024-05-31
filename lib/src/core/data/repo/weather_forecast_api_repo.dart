// Data Layer
import 'package:http/http.dart' as http;
import 'package:weather_project/src/core/data/repo/api_key.dart';
import 'dart:convert';
import '../models/weather_forecast.dart';

class WeatherForecastRepository {
  static const String apiKey = yourApiKey;


  Future<WeatherForecast> fetchWeatherForecast(String cityName) async {
    String apiUrl = 'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<WeatherDayForecast> forecasts = data['forecast']['forecastday']
          .map<WeatherDayForecast>((forecast) => WeatherDayForecast(
        date: forecast['date'],
        temperature: '${forecast['day']['avgtemp_c']}°C',
        description: forecast['day']['condition']['text'],
      ))
          .toList();

      return WeatherForecast(forecasts: forecasts);
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}
