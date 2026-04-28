import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import '../../data/questions_data.dart';
import 'widgets/result_item.dart';

class ResultView extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Map<int, Set<String>> selectedAnswersMap;
  final VoidCallback onRetry;

  const ResultView({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswersMap,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'Your Score',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          '$score / $totalQuestions',
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            itemCount: QuestionsData.questions.length,
            itemBuilder: (context, index) {
              final question = QuestionsData.questions[index];
              final selectedAnswers = selectedAnswersMap[index] ?? {};
              return ResultItem(
                questionIndex: index,
                question: question,
                selectedAnswers: selectedAnswers,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
