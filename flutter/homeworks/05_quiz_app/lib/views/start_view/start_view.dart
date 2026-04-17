import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/shared_widgets/custom_text.dart';
import 'widgets/start_q_button.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          data: 'Good morning,',
          color: AppColors.white,
          size: 16,
          fontWeight: FontWeight.w300,
        ),
        const CustomText(
          data: 'New topic is waiting',
          color: AppColors.white,
          size: 24,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        Row(
          children: [
            ExpanedStartQuizButton(),
          ],
        ),
      ],
    );
  }
}
