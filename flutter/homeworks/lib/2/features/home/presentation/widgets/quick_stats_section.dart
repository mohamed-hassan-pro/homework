import 'package:flutter/material.dart';
import 'package:homeworks/2/core/constants/app_strings.dart';
import 'package:homeworks/2/core/theme/app_colors.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Quick Stats',
          style: TextStyle(
            fontSize: 22,
            fontWeight: .w800,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: .spaceAround,
          children: [
            StatCardItem(
              icon: Icons.people,
              iconColor: AppColors.iconBgPurple,
              data: '1,234',
              label: AppStrings.usersLabel,
            ),
            StatCardItem(
              icon: Icons.star,
              iconColor: AppColors.iconBgOrange,
              data: '4.8',
              label: AppStrings.ratingLabel,
            ),
            StatCardItem(
              icon: Icons.trending_up,
              iconColor: AppColors.iconBgBlue,
              data: '98%',
              label: AppStrings.successLabel,
            ),
          ],
        ),
      ],
    );
  }
}

class StatCardItem extends StatelessWidget {
  final IconData icon;
  final String data;
  final String label;
  final Color iconColor;

  const StatCardItem({
    required this.data,
    required this.label,
    required this.icon,
    required this.iconColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 24),
              SizedBox(height: 8),
              Text(
                data,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: .bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
