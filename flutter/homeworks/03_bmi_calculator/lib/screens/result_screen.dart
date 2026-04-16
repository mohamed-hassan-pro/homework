import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/widgets/custom_widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmiResult,
    required this.bmiModel,
  });
  final double bmiResult;
  final BMIModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xff04061d),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Expanded(
                child: CustomDecorationBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: .center,
                      mainAxisSize: .min,
                      children: [
                        CustomTextStyle(value: bmiResult.round(), text: 'BMI'),
                        SizedBox(height: 8),
                        CustomTextStyle(
                          value: bmiModel.gender.name,
                          text: 'Gender',
                        ),
                        SizedBox(height: 8),

                        CustomTextStyle(value: bmiModel.age, text: 'Age'),
                        SizedBox(height: 8),
                        CustomTextStyle(
                          value: bmiModel.height.toStringAsFixed(1),
                          text: 'Height',
                        ),
                        SizedBox(height: 8),
                        CustomTextStyle(value: bmiModel.weight, text: 'Weight'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle({super.key, required this.value, required this.text});

  final dynamic value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text: $value",
      style: TextStyle(
        fontSize: 32,
        fontWeight: text == 'BMI' ? .bold : .normal,
      ),
    );
  }
}
