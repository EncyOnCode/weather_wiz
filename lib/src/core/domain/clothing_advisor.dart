import '../data/models/clothes.dart';
import '../data/models/weather.dart';

class ClothingAdvisor {
  static List<ClothingAdvice> getAdviceForWeather(Weather weather) {
    switch (weather.condition.toLowerCase()) {
      case 'sunny':
        return [const ClothingAdvice(condition: 'Sunny', advice: 'Great weather for outdoor activities!')];
      case 'partly cloudy':
        return [const ClothingAdvice(condition: 'Partly Cloudy', advice: 'Cloudy weather but no precipitation, you can safely go outside.')];
      case 'rain':
        return [const ClothingAdvice(condition: 'Rain', advice: 'Rainy weather, better take an umbrella and waterproof clothes.')];
      case 'snow':
        return [const ClothingAdvice(condition: 'Snow', advice: 'Snow, be careful on the roads and bring warm clothing.')];
      case 'moderate or heavy rain with thunder':
        return [const ClothingAdvice(condition: 'Moderate or heavy rain with thunder', advice: 'During moderate to heavy rain with thunderstorms, it is best to stay indoors and avoid going outside.')];
      case 'patchy rain nearby':
        return [const ClothingAdvice(condition: 'Patchy rain nearby', advice: 'It may rain, bring an umbrella with you')];
        default:
        return [const ClothingAdvice(condition: 'Unknown', advice: 'Something went wrong.')];
    }
  }
}