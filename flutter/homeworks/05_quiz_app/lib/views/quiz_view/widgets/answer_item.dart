import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class AnswerItem extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isMultiChoice;
  final void Function(bool?)? onChanged;

  const AnswerItem({
    super.key,
    required this.answer,
    required this.isSelected,
    this.isMultiChoice = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!isSelected);
        }
      },
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.Primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Checkbox(
              activeColor: AppColors.Primary,
              checkColor: AppColors.white,
              value: isSelected,
              onChanged: onChanged,
              // شكل الـ Checkbox يتغير بناءً على نوع السؤال (دائرة للسنجل، ومربع للمتعدد)
              shape: const CircleBorder(),
            ),
            Expanded(
              child: Text(
                answer,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.Primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
