import 'package:flutter/material.dart';
import 'package:homeworks/2/features/home/presentation/widgets/quick_stats_section.dart';

import '../widgets/welcome_banner_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  WelcomeBannerWidget(),
                  const SizedBox(height: 24),
                  QuickStatsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
