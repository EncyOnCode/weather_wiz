import '../data/models/clothes.dart';
import '../data/models/weather.dart';

class ClothingAdvisor {
  static List<ClothingAdvice> getAdviceForWeather(Weather weather) {
    switch (weather.condition.toLowerCase()) {
      case 'sunny':
        return [
          const ClothingAdvice(
              condition: 'Sunny',
              advice: 'Great weather for outdoor activities!')
        ];
      case 'partly cloudy':
        return [
          const ClothingAdvice(
              condition: 'Partly Cloudy',
              advice:
                  'Cloudy weather but no precipitation, you can safely go outside.')
        ];
      case 'rain':
        return [
          const ClothingAdvice(
              condition: 'Rain',
              advice:
                  'Rainy weather, better take an umbrella and waterproof clothes.')
        ];
      case 'snow':
        return [
          const ClothingAdvice(
              condition: 'Snow',
              advice: 'Snow, be careful on the roads and bring warm clothing.')
        ];
      case 'moderate or heavy rain with thunder':
        return [
          const ClothingAdvice(
              condition: 'Moderate or heavy rain with thunder',
              advice:
                  'During moderate to heavy rain with thunderstorms, it is best to stay indoors and avoid going outside.')
        ];
      case 'patchy rain nearby':
        return [
          const ClothingAdvice(
              condition: 'Patchy rain nearby',
              advice: 'It may rain, bring an umbrella with you')
        ];
      case 'overcast':
        return [
          const ClothingAdvice(
              condition: 'overcast',
              advice: 'Overcast weather, dont dress too lightly.'),
        ];

      case 'mist':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy rain possible':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy snow possible':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy sleet possible':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy freezing drizzle possible':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'thundery outbreaks possible':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'blowing snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'blizzard':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'fog':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'freezing fog':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy light rain':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light rain':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate rain at times':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate rain':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'heavy rain at times':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'heavy rain':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light freezing rain':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate or heavy sleet':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy light snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy moderate snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy heavy snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'heavy snow':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'ice pellets':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light rain shower':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate or rain shower':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'torrential rain shower':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light sleet showers':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light snow showers':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate or heavy snow showers':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'light showers of ice pellets':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate or heavy showers of ice pellets':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy light rain with thunder':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'patchy light snow with thunder':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      case 'moderate or heavy snow with thunder':
        return [
          const ClothingAdvice(condition: 'overcast', advice: 'TO-DO'),
        ];
      default:
        return [
          const ClothingAdvice(
              condition: 'Unknown', advice: 'Something went wrong.')
        ];
    }
  }
}