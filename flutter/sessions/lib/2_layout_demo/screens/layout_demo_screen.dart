import 'package:flutter/material.dart';

class LayoutDemoScreen extends StatelessWidget {
  const LayoutDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter layout demo')),
        body: SafeArea(child: Column(children: [Image.asset(name),Row(children: [],)])),
      ),
    );
  }
}
