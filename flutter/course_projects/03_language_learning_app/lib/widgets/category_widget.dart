import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:language_learning_app/models/category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: category.onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        color: category.bgColor,
        height: 60,
        width: double.infinity,
        child: Text(category.txt, style: kWhite18TextStyle),
      ),
    );
  }
}
