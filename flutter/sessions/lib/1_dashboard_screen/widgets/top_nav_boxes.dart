import 'package:flutter/material.dart';
import 'package:sessions/1_dashboard_screen/core/app_colors.dart';

class TopNavBoxes extends StatelessWidget {
  const TopNavBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryBox(text: 'A', color: AppColors.boxA),
        CategoryBox(text: 'B', color: AppColors.boxB),
        CategoryBox(text: 'C', color: AppColors.boxC),
      ],
    );
  }
}

class CategoryBox extends StatelessWidget {
  String text;
  Color color;
  double width = 70;
  double height = 40;

  CategoryBox({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textWhite,
        ),
      ),
    );
  }
}


