import 'package:flutter/material.dart';
import '../../data/models/weather.dart';
import '../../domain/weather_interactor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherPage extends StatefulWidget {
  final WeatherInteractor weatherInteractor;

  const WeatherPage({super.key, required this.weatherInteractor});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> _weather;
  String _weatherIconUrl = 'https://';

  @override
  void initState() {
    super.initState();
    _weather = widget.weatherInteractor.getWeather('Izhevsk');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Wiz'),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: _weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final weather = snapshot.data!;
              _weatherIconUrl = 'https://${weather.icon.substring(2)}';
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('City: ${weather.cityName}'),
                  Text('Temperature: ${weather.temperature}°C'),
                  Text('Condition: ${weather.condition}'),
                 Image.network(_weatherIconUrl),
                  Text('Wind Speed: ${weather.windSpeed} kph'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
