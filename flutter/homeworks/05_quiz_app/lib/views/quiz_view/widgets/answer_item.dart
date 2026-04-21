import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class AnswerItem extends StatefulWidget {
  final String answer;
  const AnswerItem({super.key, required this.answer});

  @override
  State<AnswerItem> createState() => _AnswerItemState();
}

class _AnswerItemState extends State<AnswerItem> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        color: _isChecked == false ? Colors.white : AppColors.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Checkbox(
            activeColor: AppColors.Primary,
            checkColor: AppColors.white,
            value: _isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                _isChecked = newValue!;
              });
            },
            shape: CircleBorder(),
          ),
          Text(
            widget.answer,
            style: TextStyle(
              color: AppColors.Primary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
