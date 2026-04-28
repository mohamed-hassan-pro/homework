import '../models/question_model.dart';

class QuestionsData {
  static final List<QuestionModel> questions = [
    QuestionModel(
      text:
          'How would you describe your level of satisfaction with the healthcare system?',
      answers: ['Strongly satisfied', 'Satisfied', 'Neutral', 'Not Satisfied'],
      correctAnswers: ['Strongly satisfied'],
    ),
    QuestionModel(
      text: 'What vitamins do you take?',
      answers: ['Vitamin D3', 'Vitamin B', 'Zinc', 'Magnesium'],
      correctAnswers: ['Vitamin D3', 'Vitamin B'],
    ),
    QuestionModel(
      text: 'How often do you exercise?',
      answers: ['Every day', 'Several times a week', 'Once a week', 'Rarely'],
      correctAnswers: ['Every day', 'Several times a week'],
    ),
    QuestionModel(
      text: 'How many hours do you sleep per night?',
      answers: ['7-8 hours', '6-7 hours', '5-6 hours', 'Less than 5 hours'],
      correctAnswers: ['7-8 hours'],
    ),
  ];
}