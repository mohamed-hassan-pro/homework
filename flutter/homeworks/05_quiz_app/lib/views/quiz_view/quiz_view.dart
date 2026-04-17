import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/views/quiz_view/widgets/back_next_item.dart';
import 'package:quiz_app/shared_widgets/custom_text.dart';
import '../../models/questions_data.dart';
import '../../models/questions_model.dart';
import 'widgets/answer_item.dart';
import 'widgets/current_q_item.dart';

class QuizView extends StatefulWidget {
  QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<QuestionsModel> questions = QuestionsData.questions;

  int currentQIndex = 0;

  void nextQuestion() {
    currentQIndex++;
    setState(() {});
  }

  void prevQuestion() {
    currentQIndex--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CurrentQItem(currentQIndex: currentQIndex + 1),
        const SizedBox(height: 16),
        CustomText(
          data: questions[currentQIndex].text,
          color: AppColors.white,
          size: 24,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 32),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questions[currentQIndex].answers.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) =>
              AnswerItem(answer: questions[currentQIndex].answers[index]),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackNextItem(
              text: 'Back',
              icon: Icons.arrow_back_ios_new,
              onPressed: prevQuestion,
              bgColor: Colors.transparent,
            ),
            BackNextItem(
              text: 'Next',
              icon: Icons.arrow_forward_ios,
              onPressed: nextQuestion,
              bgColor: AppColors.bgButton,
            ),
          ],
        ),
      ],
    );
  }
}
