import '../models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<List<Weather>> getWeatherForecast(String cityName);
}
