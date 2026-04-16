import 'package:flutter/material.dart';
import 'package:language_learning_app/data/colors_data.dart';
import 'package:language_learning_app/data/family_members_data.dart';
import 'package:language_learning_app/data/numbers_data.dart';
import 'package:language_learning_app/data/phrases_data.dart';
import 'package:language_learning_app/models/category.dart' as model;
import 'package:language_learning_app/views/items_view.dart';

class CategoryData {
  static List<model.Category> getCategories(BuildContext context) {
    return [
      model.Category(
        txt: 'Numbers',
        bgColor: Colors.orange,
        items: NumbersData.numbers,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Numbers',
                bgColor: Colors.orange,
                items: NumbersData.numbers,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      model.Category(
        txt: 'Family Members',
        bgColor: Colors.green,
        items: FamilyMembersData.familyMembers,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Family Members',
                bgColor: Colors.green,
                items: FamilyMembersData.familyMembers,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      model.Category(
        txt: 'Colors',
        bgColor: Colors.purple,
        items: ColorsData.colors,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Colors',
                bgColor: Colors.purple,
                items: ColorsData.colors,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      model.Category(
        txt: 'Phrases',
        bgColor: Colors.blue,
        items: PhrasesData.phrases,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: model.Category(
                txt: 'Phrases',
                bgColor: Colors.blue,
                items: PhrasesData.phrases,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
