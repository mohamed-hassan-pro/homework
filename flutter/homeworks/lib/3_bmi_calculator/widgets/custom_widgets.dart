import 'package:flutter/material.dart';

class CustomDecorationBox extends StatelessWidget {
  const CustomDecorationBox({
    super.key,
    required this.child,
    this.color = const Color(0xff17172f),
  });
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
