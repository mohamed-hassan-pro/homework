import 'package:flutter/material.dart';
import '../../../data/questions_data.dart';
import '../../../manager/quiz_manager.dart';
import 'question_content.dart';

class QuestionsPageView extends StatelessWidget {
  final QuizManager quizManager;

  const QuestionsPageView({super.key, required this.quizManager});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: quizManager.pageController,
      onPageChanged: quizManager.updateCurrentQuestionIndex,
      itemCount: QuestionsData.questions.length,
      itemBuilder: (context, index) {
        final question = QuestionsData.questions[index];
        final isMultiChoice = question.correctAnswers.length > 1;
        return QuestionContent(
          question: question,
          selectedAnswers: quizManager.selectedAnswersMap[index] ?? {},
          onAnswerSelected: (String answerText, bool newValue) {
            quizManager.toggleAnswer(
              questionIndex: index,
              answerText: answerText,
              newValue: newValue,
              isMultiChoice: isMultiChoice,
            );
          },
        );
      },
    );
  }
}
