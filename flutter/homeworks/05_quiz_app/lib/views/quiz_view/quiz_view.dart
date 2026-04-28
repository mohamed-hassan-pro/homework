import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/views/quiz_view/widgets/back_next_item.dart';
import '../../data/questions_data.dart';
import '../../manager/quiz_manager.dart';
import '../../shared_widgets/struct_views.dart';
import '../result_view/result_view.dart';
import 'widgets/question_content.dart';
import 'widgets/current_q_item.dart';

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
            CurrentQItem(currentQIndex: quizManager.currentQIndex + 1),
            const SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: quizManager.pageController,
                onPageChanged: quizManager.updateCurrentQuestionIndex,
                itemCount: QuestionsData.questions.length,
                itemBuilder: (context, index) {
                  final question = QuestionsData.questions[index];
                  final isMultiChoice = question.correctanswer.length > 1;

                  return QuestionContent(
                    question: question,
                    selectedAnswers:
                        quizManager.selectedAnswersMap[index] ?? {},
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
              ),
            ),
            Row(
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
                  onPressed: () {
                    if (quizManager.currentQIndex == QuestionsData.questions.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StructureViews(
                            body: ResultView(
                              score: quizManager.calculateScore(),
                              totalQuestions: QuestionsData.questions.length,
                              onRetry: () {
                                quizManager.resetQuiz();
                              },
                            ),
                          ),
                        ),
                      );
                    } else {
                      quizManager.nextQuestion();
                    }
                  },
                  bgColor: AppColors.bgButton,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
