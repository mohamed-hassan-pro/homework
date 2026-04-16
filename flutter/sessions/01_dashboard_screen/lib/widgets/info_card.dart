import 'package:flutter/material.dart';
import 'package:dashboard_screen/core/app_colors.dart';

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
