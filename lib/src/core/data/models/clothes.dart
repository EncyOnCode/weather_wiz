import 'package:flutter/foundation.dart';

@immutable
base class ClothingAdvice {
  const ClothingAdvice({required this.condition, required this.advice});

  final String condition;
  final String advice;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClothingAdvice &&
          condition == other.condition &&
          advice == other.advice;

  @override
  int get hashCode => Object.hashAll([condition, advice]);
}
