import 'package:flutter/foundation.dart';

@immutable
base class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String icon;
  final double windSpeed;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.windSpeed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          cityName == other.cityName &&
          temperature == other.temperature &&
          condition == other.condition &&
          icon == other.icon &&
          windSpeed == other.windSpeed;

  @override
  int get hashCode =>
      Object.hashAll([cityName, temperature, condition, icon, windSpeed]);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['location']['name'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'], // Убираем префикс "file://"
      windSpeed: json['current']['wind_kph'],
    );
  }
}
