import 'package:flutter/material.dart';
import 'package:sessions/1_dashboard_screen/core/app_colors.dart';
import 'package:sessions/1_dashboard_screen/widgets/fancy_section.dart';
import 'package:sessions/1_dashboard_screen/widgets/info_card.dart';
import 'package:sessions/1_dashboard_screen/widgets/top_nav_boxes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Container(
              decoration: BoxDecoration(color: AppColors.mainBackground),
              child: Column(
                children: [
                  Spacer(flex: 1),
                  const TopNavBoxes(),
                  Spacer(flex: 1),
                  const FancySection(),
                  Spacer(flex: 1),
                  const InfoCards(),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
