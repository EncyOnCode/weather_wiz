import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApi {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String apiKey = 'cd08a62987c1474481753333241505';

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
