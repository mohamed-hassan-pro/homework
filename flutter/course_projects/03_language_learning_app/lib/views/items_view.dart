import 'package:flutter/material.dart';
import 'package:language_learning_app/models/category.dart';
import '../constants.dart';
import '../widgets/item_widget.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.txt, style: kWhite18TextStyle),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: category.items.length,
        itemBuilder: (context, index) => ItemWidget(
          color: category.bgColor,
          item: category.items[index],
        ),
      ),
    );
  }
}
