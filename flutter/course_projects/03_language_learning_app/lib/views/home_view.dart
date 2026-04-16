import 'package:flutter/material.dart';
import '../constants.dart';
import '../data/category_data.dart';
import '../widgets/category_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toku', style: kWhite18TextStyle),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: CategoryData.getCategories(context).length,
        itemBuilder: (context, index) => CategoryWidget(
          category: CategoryData.getCategories(context)[index],
        ),
      ),
    );
  }
}
