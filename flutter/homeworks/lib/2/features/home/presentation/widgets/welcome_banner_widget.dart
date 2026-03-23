import 'package:flutter/material.dart';
import 'package:homeworks/2/core/constants/app_dimensions.dart';
import 'package:homeworks/2/core/constants/app_strings.dart';
import 'package:homeworks/2/core/theme/app_colors.dart';
import 'package:homeworks/2/core/theme/app_text_styles.dart';

class WelcomeBannerWidget extends StatelessWidget {
  const WelcomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          color: AppColors.bannerBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(AppStrings.welcomeGreeting, style: AppTextStyles.bannerTitle),
            const SizedBox(height: AppDimensions.paddingSmall),
            Text(
              AppStrings.welcomeSubtitle,
              style: AppTextStyles.bannerSubtitle,
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.borderRadius,
                    ),
                  ),
                  backgroundColor: AppColors.bannerButton,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingMedium,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  AppStrings.getStartedButton,
                  style: AppTextStyles.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
