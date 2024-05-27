import '../data/models/clothes.dart';
import '../data/models/weather.dart';

class ClothingAdvisor {
  static List<ClothingAdvice> getAdviceForWeather(Weather weather) {
    switch (weather.condition) {
      case 'Sunny':
        return [const ClothingAdvice(condition: 'Sunny', advice: 'Отличная погода для прогулок на свежем воздухе!')];
      case 'Partly cloudy':
        return [const ClothingAdvice(condition: 'Partly cloudy', advice: 'Облачная погода, но без осадков, можно смело выходить на улицу.')];
      case 'Rain':
        return [const ClothingAdvice(condition: 'Rain', advice: 'Дождливая погода, лучше взять зонтик и непромокаемую одежду.')];
      case 'Snow':
        return [const ClothingAdvice(condition: 'Snow', advice: 'Снег, осторожно на дорогах и возьмите с собой теплую одежду.')];
      case 'Moderate or heavy rain with thunder':
        return [const ClothingAdvice(condition: 'Moderate or heavy rain with thunder', advice: 'Во время умеренного или сильного дождя с грозой лучше остаться в помещении и избегать выхода на улицу.')];
      default:
        return [const ClothingAdvice(condition: 'Unknown', advice: 'Что-то пошло не так.')];
    }
  }
}