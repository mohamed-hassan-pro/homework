import 'package:bmi_calculator/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff03051a),
      ),
      debugShowCheckedModeBanner: false,
      home: const BmiCalculatorScreen(),
    );
  }
}
