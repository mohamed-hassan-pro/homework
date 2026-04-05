import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/Models/calculate_bmi.dart';
import 'package:homeworks/3_bmi_calculator/result_screen.dart';

class CalculateBMIButton extends StatelessWidget {
  const CalculateBMIButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Calculator(height: height, weight: weight).calcBMI();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: 5)),
        );
      },
      child: Container(
        width: double.infinity,
        color: Color(0xffed0d54),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'CALCULATE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: .bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
