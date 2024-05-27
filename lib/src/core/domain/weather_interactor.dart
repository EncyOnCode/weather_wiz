import '../data/models/weather.dart';
import '../data/repo/weather_repo.dart';

class WeatherInteractor {
  final WeatherRepository _repository;

  WeatherInteractor(this._repository);

  Future<Weather> getWeather(String cityName) async {
    return await _repository.fetchWeather(cityName);
  }

  Future<List<Weather>> getForecast(String cityName) async {
    return await _repository.getWeatherForecast(cityName);
  }
}
