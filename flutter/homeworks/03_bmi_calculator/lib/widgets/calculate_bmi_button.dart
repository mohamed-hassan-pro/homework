import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/screens/result_screen.dart';

class CalculateBMIButton extends StatelessWidget {
  const CalculateBMIButton({super.key, required this.bmiModel});
  final BMIModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultScreen(bmiResult: bmiModel.calcBMI(), bmiModel: bmiModel),
          ),
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
