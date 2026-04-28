import 'package:flutter/material.dart';
import '../data/questions_data.dart';

class QuizManager extends ChangeNotifier {
  int currentQIndex = 0;
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

  void nextQuestion() {
    if (currentQIndex < QuestionsData.questions.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevQuestion() {
    if (currentQIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void updateCurrentQuestionIndex(int newIndex) {
    currentQIndex = newIndex;
    notifyListeners(); // إخبار الشاشة أن رقم السؤال تغير لكي تعيد رسم نفسها
  }

  // هذه الدالة تتولى منطق اختيار الإجابة بالكامل
  void toggleAnswer({
    required int questionIndex,
    required String answerText,
    required bool newValue,
    required bool isMultiChoice,
  }) {
    if (isMultiChoice) {
      // حالة المتعدد: نضيف أو نحذف من المجموعة
      if (newValue) {
        selectedAnswersMap.putIfAbsent(questionIndex, () => {}).add(answerText);
      } else {
        selectedAnswersMap[questionIndex]?.remove(answerText);
      }
    } else {
      // حالة الإجابة الواحدة: نمسح القديم ونضع الإجابة الجديدة فقط
      selectedAnswersMap[questionIndex] = {answerText};
    }

    notifyListeners(); // إخبار الشاشة أن الإجابات المختارة تغيرت
  }

  // دالة لحساب النتيجة النهائية
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < QuestionsData.questions.length; i++) {
      final question = QuestionsData.questions[i];
      final selected = selectedAnswersMap[i] ?? {};
      final correct = question.correctanswer.toSet();

      // يجب أن يتطابق عدد الإجابات المختارة مع الصحيحة وأن تحتويها كلها
      if (selected.length == correct.length && selected.containsAll(correct)) {
        score++;
      }
    }
    return score;
  }

  // دالة لتصفير الكويز للبدء من جديد
  void resetQuiz() {
    currentQIndex = 0;
    selectedAnswersMap.clear();
    pageController.jumpToPage(0);
    notifyListeners();
  }
}
