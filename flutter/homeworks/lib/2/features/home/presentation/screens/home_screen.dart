import 'package:flutter/material.dart';

import '../widgets/welcome_banner_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(child: Column(children: [
            WelcomeBannerWidget(),

          ])),
        ),
      ),
    );
  }
}
