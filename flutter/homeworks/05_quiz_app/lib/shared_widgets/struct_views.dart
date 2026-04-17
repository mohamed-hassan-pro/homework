import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StuctViews extends StatelessWidget {
  const StuctViews({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/image.png', fit: BoxFit.cover),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 32,
                ),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
