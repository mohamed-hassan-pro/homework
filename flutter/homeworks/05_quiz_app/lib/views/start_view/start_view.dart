import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'widgets/start_q_button.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good morning,',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'New topic is waiting',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Row(children: [Expanded(child: StartQuizButton())]),
      ],
    );
  }
}
