import 'package:bmi_calculator/screens/bmi_calculator_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const BMICalculatorApp(),
    ),
  );
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff03051a),
      ),
      debugShowCheckedModeBanner: false,
      home: const BmiCalculatorScreen(),
    );
  }
}
