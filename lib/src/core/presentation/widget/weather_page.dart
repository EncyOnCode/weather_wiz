import 'package:flutter/material.dart';
import '../../data/models/weather.dart';
import '../../domain/weather_interactor.dart';

class WeatherPage extends StatefulWidget {
  final WeatherInteractor weatherInteractor;

  const WeatherPage({Key? key, required this.weatherInteractor}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> _weather;
  String _weatherIconUrl = 'https://';
  final TextEditingController _cityController = TextEditingController();

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
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'City: ${weather.cityName}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Temperature: ${weather.temperature}°C',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Condition: ${weather.condition}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Image.network(_weatherIconUrl),
                    Text(
                      'Wind Speed: ${weather.windSpeed} kph',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _weather = widget.weatherInteractor.getWeather(_cityController.text);
                        });
                      },
                      child: const Text('Get Weather'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
