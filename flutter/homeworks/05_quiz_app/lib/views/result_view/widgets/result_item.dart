import 'package:flutter/material.dart';
import '../../../models/question_model.dart';
import '../../../core/app_colors.dart';

class ResultItem extends StatelessWidget {
  final int questionIndex;
  final QuestionModel question;
  final Set<String> selectedAnswers;

  const ResultItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final correctAnswers = question.correctAnswers.toSet();
    final isCorrect = selectedAnswers.length == correctAnswers.length &&
        selectedAnswers.containsAll(correctAnswers);

    final borderColor = isCorrect ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Q${questionIndex + 1}: ${question.text}',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your Answer: ${selectedAnswers.isEmpty ? "No answer" : selectedAnswers.join(", ")}',
            style: TextStyle(
              color: isCorrect ? Colors.greenAccent : Colors.redAccent,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Correct Answer: ${question.correctAnswers.join(", ")}',
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
