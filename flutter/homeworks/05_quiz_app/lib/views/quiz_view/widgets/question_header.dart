import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionHeader extends StatelessWidget {
  final int currentQuestionIndex;
  const QuestionHeader({super.key, required this.currentQuestionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 143,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.bgButton,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/$currentQuestionIndex.svg',
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Text(
            'Question $currentQuestionIndex',
            style: const TextStyle(
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
