import 'package:flutter/material.dart';
import 'package:language_learning_app/models/item_model.dart';

class Category {
  final String txt;
  final Color bgColor;
  final VoidCallback onTap;
  final List<ItemModel> items;
  const Category({
    required this.txt,
    required this.bgColor,
    required this.onTap,
    required this.items,
  });
}
