import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../manager/quiz_manager.dart';
import 'back_next_item.dart';

class QuizNavigationButtons extends StatelessWidget {
  final QuizManager quizManager;

  const QuizNavigationButtons({super.key, required this.quizManager});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackNextItem(
          text: 'Back',
          icon: Icons.arrow_back_ios_new,
          onPressed: quizManager.prevQuestion,
          bgColor: Colors.transparent,
        ),
        BackNextItem(
          text: 'Next',
          icon: Icons.arrow_forward_ios,
          onPressed: () => quizManager.nextQuestion(context),
          bgColor: AppColors.bgButton,
        ),
      ],
    );
  }
}
