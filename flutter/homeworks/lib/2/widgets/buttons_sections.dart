import 'package:flutter/material.dart';

class ButtonsSections extends StatelessWidget {
  const ButtonsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Button(txt: 'Settings', bgColor: Color(0xff2196F3)),
        SizedBox(width: 16),
        Button(txt: 'Profile', bgColor: Color(0xffFF9700)),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String txt;
  final Color bgColor;
  const Button({super.key, required this.txt, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(txt, style: TextStyle(fontWeight: .bold, fontSize: 18)),
      ),
    );
  }
}
