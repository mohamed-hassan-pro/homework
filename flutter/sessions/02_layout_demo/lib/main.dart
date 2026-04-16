import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:layout_demo/layout_demo_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const LayoutDemoApp(),
    ),
  );
}

class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LayoutDemoScreen(),
    );
  }
}
