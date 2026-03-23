import 'package:flutter/material.dart';
import 'package:sessions/1_dashboard_screen/core/app_colors.dart';
import 'package:sessions/1_dashboard_screen/widgets/custom_box.dart';

class InfoCards extends StatelessWidget {
  const InfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Info Cards',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: .center,
          children: [
            InfoSummaryCard(
              number: '23',
              color: AppColors.activeGreen,
              text: 'Active',
            ),
            SizedBox(width: 16),
            InfoSummaryCard(
              number: '15',
              color: AppColors.pendingOrange,
              text: 'Pinding',
            ),
            SizedBox(width: 16),
            InfoSummaryCard(
              number: '7',
              color: AppColors.completedGreen,
              text: 'Completed',
            ),
          ],
        ),
      ],
    );
  }
}
