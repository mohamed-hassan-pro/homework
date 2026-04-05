import 'package:flutter/material.dart';

class CalculateBMIButton extends StatelessWidget {
  const CalculateBMIButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffeb1555),
        ),
        child: const Center(
          child: Text(
            'CALCULATE',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
