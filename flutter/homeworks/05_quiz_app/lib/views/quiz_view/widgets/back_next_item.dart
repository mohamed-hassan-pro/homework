import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';

class BackNextItem extends StatelessWidget {
  const BackNextItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.bgColor,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 105,
        height: 39,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.bgButton),
          borderRadius: BorderRadius.circular(8),
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (text == 'Back') Icon(icon, color: Colors.white, size: 16),
            if (text == 'Back') const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (text == 'Next') const SizedBox(width: 8),
            if (text == 'Next') Icon(icon, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
