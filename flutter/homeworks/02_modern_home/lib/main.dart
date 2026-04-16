import 'package:flutter/material.dart';
import 'package:modern_home/home_screen.dart';

void main() {
  runApp(const ModernHomeApp());
}

class ModernHomeApp extends StatelessWidget {
  const ModernHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
