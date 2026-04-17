import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../shared_widgets/custom_text.dart';

class AnswerItem extends StatelessWidget {
  final String answer;
  const AnswerItem({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {}, shape: CircleBorder()),
          CustomText(
            data: answer,
            color: AppColors.textPrimary,
            size: 16,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
