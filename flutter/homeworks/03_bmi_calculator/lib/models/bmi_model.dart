import 'dart:math';

enum Gender { male, female, none }

class BMIModel {
  BMIModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
  Gender gender;
  double height;
  int weight;
  int age;
  double calcBMI() => weight / pow(height / 100, 2);
}
