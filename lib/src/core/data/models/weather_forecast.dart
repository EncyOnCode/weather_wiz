import 'package:flutter/foundation.dart';

@immutable
base class WeatherForecast {
  final List<WeatherDayForecast> forecasts;

  const WeatherForecast({required this.forecasts});

  @override
  int get hashCode => Object.hashAll([forecasts]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherForecast && forecasts == other.forecasts;
}

class WeatherDayForecast {
  final String date;
  final String temperature;
  final String description;

  WeatherDayForecast({
    required this.date,
    required this.temperature,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDayForecast &&
          date == other.date &&
          temperature == other.temperature &&
          description == other.description;

  @override
  int get hashCode => Object.hashAll([date, temperature, description]);
}
