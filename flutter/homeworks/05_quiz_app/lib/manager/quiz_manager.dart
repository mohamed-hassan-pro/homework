import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../shared_widgets/app_background.dart';
import '../views/result_view/result_view.dart';

class QuizManager extends ChangeNotifier {
  int currentQuestionIndex = 0;
  late final PageController pageController;

  Map<int, Set<String>> selectedAnswersMap = {};

  QuizManager() {
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestionIndex < QuestionsData.questions.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppBackground(
            body: ResultView(
              score: calculateScore(),
              totalQuestions: QuestionsData.questions.length,
              selectedAnswersMap: selectedAnswersMap,
              onRetry: resetQuiz,
            ),
          ),
        ),
      );
    }
  }

  void prevQuestion() {
    if (currentQuestionIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void updateCurrentQuestionIndex(int newIndex) {
    currentQuestionIndex = newIndex;
    notifyListeners();
  }

  void toggleAnswer({
    required int questionIndex,
    required String answerText,
    required bool newValue,
    required bool isMultiChoice,
  }) {
    if (isMultiChoice) {
      if (newValue) {
        selectedAnswersMap.putIfAbsent(questionIndex, () => {}).add(answerText);
      } else {
        selectedAnswersMap[questionIndex]?.remove(answerText);
      }
    } else {
      selectedAnswersMap[questionIndex] = {answerText};
    }

    notifyListeners();
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < QuestionsData.questions.length; i++) {
      final question = QuestionsData.questions[i];
      final selected = selectedAnswersMap[i] ?? {};
      final correct = question.correctAnswers.toSet();

      if (selected.length == correct.length && selected.containsAll(correct)) {
        score++;
      }
    }
    return score;
  }

  void resetQuiz() {
    currentQuestionIndex = 0;
    selectedAnswersMap.clear();
    pageController.jumpToPage(0);
    notifyListeners();
  }
}
