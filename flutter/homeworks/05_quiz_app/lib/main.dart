import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/views/start_view/start_view.dart';
import 'package:quiz_app/shared_widgets/app_background.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        scaffoldBackgroundColor: AppColors.bgScaffold,
        useMaterial3: true,
      ),
      home: const AppBackground(body: StartView()),
    );
  }
}