import 'package:flutter/material.dart';
import 'package:language_learning_app/data/numbers_data.dart';
import 'package:language_learning_app/models/category_model.dart' as model;
import 'package:language_learning_app/views/items_view.dart';

class CategoryData {
  static List<model.Category> categories(BuildContext context) {
    return [
      model.Category(
        txt: 'Numbers',
        bgColor: Colors.orange,
        items: Data.numbers,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Numbers',
                bgColor: Colors.orange,
                items: Data.numbers,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      model.Category(
        txt: 'Family Members',
        bgColor: Colors.green,
        items: Data.familyMembers,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Family Members',
                bgColor: Colors.green,
                items: Data.familyMembers,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      model.Category(
        txt: 'Colors',
        bgColor: Colors.purple,
        items: Data.colors,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Colors',
                bgColor: Colors.purple,
                items: Data.colors,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      model.Category(
        txt: 'Phrases',
        bgColor: Colors.blue,
        items: Data.phrases,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Phrases',
                bgColor: Colors.blue,
                items: Data.phrases,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
