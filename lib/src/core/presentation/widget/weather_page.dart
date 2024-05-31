import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/src/core/data/repo/weather_repo.dart';
import '../../data/models/weather.dart';
import '../../domain/clothing_advisor.dart';
import '../../domain/weather_interactor.dart';
import 'advisior_widget.dart';
import '../../data/models/weather_forecast.dart';
import '../../data/repo/weather_forecast_api_repo.dart';

final TextEditingController _cityController = TextEditingController();

class WeatherPage extends StatefulWidget {
  final WeatherInteractor weatherInteractor;

  const WeatherPage({super.key, required this.weatherInteractor});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> _weather;
  String _weatherIconUrl = 'https://';
  late final WeatherRepository weatherRepository;

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
        automaticallyImplyLeading: false
        ,
      ),
      body: FutureBuilder<Weather>(
        future: _weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const Text(
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    'Wrong city name',
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherPage(
                              weatherInteractor: widget.weatherInteractor),
                        ),
                      );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            final weather = snapshot.data!;
            _weatherIconUrl = 'https://${weather.icon.substring(2)}';
            ClothingAdvisor.getAdviceForWeather(weather);
            if (kDebugMode) {
              print('Weather condition: ${weather.condition}');
            }
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'City: ${weather.cityName}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text('Temperature: ${weather.temperature}°C'),
                    Text('Condition: ${weather.condition}'),
                    Image.network(_weatherIconUrl),
                    Text('Wind speed: ${weather.windSpeed}kph'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            _weather = widget.weatherInteractor
                                .getWeather(_cityController.text);
                          },
                        );
                      },
                      child: const Text('Get weather'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClothingAdviceWidget(weather: weather),
                    const SizedBox(
                      height: 20,
                    ),
                    const WeatherForecastPresenter(),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class WeatherForecastPresenter extends StatefulWidget {
  const WeatherForecastPresenter({super.key});

  @override
  _WeatherForecastPresenterState createState() =>
      _WeatherForecastPresenterState();
}

class _WeatherForecastPresenterState extends State<WeatherForecastPresenter> {
  late Future<WeatherForecast> _forecastFuture;

  @override
  void initState() {
    super.initState();
    _forecastFuture =
        WeatherForecastRepository().fetchWeatherForecast('Izhevsk');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherForecast>(
      future: _forecastFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final forecasts = snapshot.data!.forecasts;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecasts.length,
              itemBuilder: (context, index) {
                final forecast = forecasts[index];
                return SizedBox(
                  height: 60,
                  child: WeatherForecastCard(forecast: forecast),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class WeatherForecastCard extends StatelessWidget {
  final WeatherDayForecast forecast;

  const WeatherForecastCard({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              forecast.date,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(forecast.temperature),
              subtitle: Text(forecast.description),
            ),
          ],
        ),
      ),
    );
  }
}
