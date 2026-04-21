import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../shared_widgets/custom_text.dart';
import '../../../shared_widgets/struct_views.dart';
import '../../quiz_view/quiz_view.dart';

class ExpanedStartQuizButton extends StatelessWidget {
  const ExpanedStartQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StructureViews(body: QuizView()),
            ),
          );
        },
        child: const CustomText(
          data: 'Start Quiz',
          color: AppColors.textPrimary,
          size: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
