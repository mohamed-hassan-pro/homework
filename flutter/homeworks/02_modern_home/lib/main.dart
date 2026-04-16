import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:modern_home/home_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ModernHomeApp(),
    ),
  );
}

class ModernHomeApp extends StatelessWidget {
  const ModernHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
