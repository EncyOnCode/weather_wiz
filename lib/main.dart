import 'package:flutter/material.dart';
import 'package:weather_project/src/core/data/repo/weather_api_repo.dart';
import 'package:weather_project/src/core/domain/weather_interactor.dart';
import 'package:weather_project/src/core/presentation/widget/weather_page.dart';
import 'package:weather_project/src/core/utils/constants/theme.dart';

void main() {
  // Замените на свой API ключ
  final repository = WeatherApiRepository();
  final interactor = WeatherInteractor(repository);

  runApp(MyApp(interactor: interactor));
}

class MyApp extends StatelessWidget {
  final WeatherInteractor interactor;

  const MyApp({super.key, required this.interactor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: themeData(),
      home: WeatherPage(weatherInteractor: interactor,),
    );
  }
}
