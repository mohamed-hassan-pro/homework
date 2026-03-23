import 'package:flutter/material.dart';
import 'package:sessions/1_dashboard_screen/core/app_colors.dart';

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

class FancyItemCard extends StatelessWidget {
  String text;
  Color color;
  double width = 50;
  double height = 50;

  FancyItemCard({required this.text, required this.color, super.key});

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

class InfoSummaryCard extends StatelessWidget {
  String number;
  String text;
  Color color;

  InfoSummaryCard({
    required this.number,
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: AppColors.textWhite),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
