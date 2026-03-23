import 'package:flutter/material.dart';
import 'package:sessions/1_dashboard_screen/core/app_colors.dart';
import 'package:sessions/1_dashboard_screen/widgets/custom_box.dart';

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
