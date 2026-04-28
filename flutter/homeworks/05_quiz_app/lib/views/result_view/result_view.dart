import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';

class ResultView extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRetry;

  const ResultView({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Score',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          '$score / $totalQuestions',
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 48,
            fontWeight: .bold,
          ),
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              onRetry();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.bgButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Again',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: .bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
