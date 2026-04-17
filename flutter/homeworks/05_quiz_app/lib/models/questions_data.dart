import 'questions_model.dart';

class QuestionsData {
  static final List<QuestionsModel> questions = [
    QuestionsModel(
      text:
          'How would you describe your level of satisfaction with the healthcare system?',
      answers: ['Strongly satisfied', 'Satisfied', 'Neutral', 'Not Satisfied'],
      correctanswer: 'Strongly satisfied',
    ),
    QuestionsModel(
      text: 'What vitamins do you take?',
      answers: ['Vitamin D3', 'Vitamin B', 'Zinc', 'Magnesium'],
      correctanswer: 'Vitamin D3',
    ),
    QuestionsModel(
      text: 'How often do you exercise?',
      answers: ['Every day', 'Several times a week', 'Once a week', 'Rarely'],
      correctanswer: 'Every day',
    ),
    QuestionsModel(
      text: 'How many hours do you sleep per night?',
      answers: ['7-8 hours', '6-7 hours', '5-6 hours', 'Less than 5 hours'],
      correctanswer: '7-8 hours',
    ),
  ];
}