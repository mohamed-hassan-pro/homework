import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/models/bmi_model.dart';
import 'package:homeworks/3_bmi_calculator/widgets/calculate_bmi_button.dart';
import 'package:homeworks/3_bmi_calculator/widgets/gender_section.dart';
import 'package:homeworks/3_bmi_calculator/widgets/heigh_slider_card.dart';
import 'package:homeworks/3_bmi_calculator/widgets/weight_age_section.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  final BMIModel bmiModel = BMIModel(
    age: 18,
    gender: Gender.male,
    height: 180,
    weight: 70,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff03051a),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: Color(0xff04061d),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(child: GenderSection(bmiModel: bmiModel)),
                SizedBox(height: 32),
                Expanded(child: HeightSliderCard(bmiModel: bmiModel)),
                SizedBox(height: 32),
                Expanded(child: WeightAgeSection(bmiModel: bmiModel)),
                SizedBox(height: 32),
                CalculateBMIButton(bmiModel: bmiModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// الحاجة اللي بتتغير وبتتغير بسبب ايه او فين

                // custom app bar
                // Container(
                //   height: 56,
                //   width: double.infinity,
                //   color: Color(0xff04061d),
                //   child: Text('BMI CALCULATOR'),
                // ),