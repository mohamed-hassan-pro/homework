class QuestionModel {
  final String text;
  final List<String> answers;
  final List<String> correctAnswers;

  QuestionModel({
    required this.text,
    required this.answers,
    required this.correctAnswers,
  });
}
