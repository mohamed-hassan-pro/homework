import 'package:flutter/material.dart';
import '../../manager/quiz_manager.dart';
import 'widgets/question_header.dart';
import 'widgets/questions_page_view.dart';
import 'widgets/quiz_navigation_buttons.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  late final QuizManager quizManager;

  @override
  void initState() {
    super.initState();
    quizManager = QuizManager();
  }

  @override
  void dispose() {
    quizManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: quizManager,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionHeader(currentQuestionIndex: quizManager.currentQuestionIndex + 1),
            const SizedBox(height: 16),
            Expanded(
              child: QuestionsPageView(quizManager: quizManager),
            ),
            QuizNavigationButtons(quizManager: quizManager),
          ],
        );
      },
    );
  }
}
