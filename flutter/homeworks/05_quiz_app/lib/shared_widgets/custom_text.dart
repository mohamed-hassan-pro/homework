import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.data,
    required this.color,
    required this.size,
    required this.fontWeight,
    this.textAlign,
  });
  final String data;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
