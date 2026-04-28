import 'package:flutter/material.dart';
import '../../../models/question_model.dart';
import 'answer_item.dart';

class QuestionContent extends StatelessWidget {
  final QuestionModel question;
  final Set<String> selectedAnswers;
  final void Function(String answer, bool newValue) onAnswerSelected;

  const QuestionContent({
    super.key,
    required this.question,
    required this.selectedAnswers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isMultiChoice = question.correctAnswers.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 32),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: question.answers.length,
          separatorBuilder: (context, _) => const SizedBox(height: 8),
          itemBuilder: (context, answerIndex) {
            final answerText = question.answers[answerIndex];
            final isSelected = selectedAnswers.contains(answerText);
            return AnswerItem(
              answer: answerText,
              isSelected: isSelected,
              isMultiChoice: isMultiChoice,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                  onAnswerSelected(answerText, newValue);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
