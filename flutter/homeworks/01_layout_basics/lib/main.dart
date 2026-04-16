import 'package:flutter/material.dart';
import 'package:layout_basics/h1.dart';

void main() {
  runApp(const LayoutBasicsApp());
}

class LayoutBasicsApp extends StatelessWidget {
  const LayoutBasicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const H1(),
    );
  }
}
