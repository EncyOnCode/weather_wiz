import 'package:flutter/material.dart';
import '../../data/models/clothes.dart';
import '../../data/models/weather.dart';
import '../../domain/clothing_advisor.dart';

class ClothingAdviceWidget extends StatelessWidget {
  final Weather weather;

  const ClothingAdviceWidget({super.key, required this.weather});

  ClothingAdvice getMostSuitableAdvice() {
    final adviceList = ClothingAdvisor.getAdviceForWeather(weather);
    if (adviceList.isNotEmpty) {
      // Возвращаем первый совет из списка, так как нам нужен только один
      return adviceList.first;
    } else {
      // Возвращаем дефолтный совет, если список пустой
      return const ClothingAdvice(
        condition: 'Unknown',
        advice:
            'Проверьте прогноз погоды и подготовьтесь соответствующим образом.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final advice = getMostSuitableAdvice();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.grey.shade400, width: 1),
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              advice.condition,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              advice.advice,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
