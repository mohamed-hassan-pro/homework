import 'package:flutter/material.dart';
import 'package:sessions/1_dashboard_screen/core/app_colors.dart';

import 'package:sessions/1_dashboard_screen/widgets/custom_box.dart';

class TopNavBoxes extends StatelessWidget {
  const TopNavBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryBox(text: 'A', color: AppColors.boxA),
        CategoryBox(text: 'B', color: AppColors.boxB),
        CategoryBox(text: 'C', color: AppColors.boxC),
      ],
    );
  }
}
