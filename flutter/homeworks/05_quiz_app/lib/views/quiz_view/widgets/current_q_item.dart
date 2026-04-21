import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';

class CurrentQItem extends StatelessWidget {
  final int currentQIndex;
  const CurrentQItem({super.key, required this.currentQIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.bgButton,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Text(
            'Question $currentQIndex',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
