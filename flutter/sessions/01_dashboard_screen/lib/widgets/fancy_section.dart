import 'package:flutter/material.dart';
import 'package:dashboard_screen/core/app_colors.dart';

class FancySection extends StatelessWidget {
  const FancySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: AppColors.fancySectionBg),
        child: Column(
          children: [
            Text(
              'Fancy Section',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: .center,
              children: [
                FancyItemCard(
                  text: '1',
                  color: AppColors.p1,
                ),
                SizedBox(width: 8),
                FancyItemCard(
                  text: '2',
                  color: AppColors.p2,
                ),
                SizedBox(width: 8),
                FancyItemCard(
                  text: '3',
                  color: AppColors.p3,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: .center,
              children: [
                FancyItemCard(
                  text: '4',
                  color: AppColors.p4,
                ),
                SizedBox(width: 8),
                FancyItemCard(
                  text: '5',
                  color: AppColors.p5,
                ),
                SizedBox(width: 8),
                FancyItemCard(
                  text: '6',
                  color: AppColors.p6,
                ),
              ],
            ),
          ],
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
