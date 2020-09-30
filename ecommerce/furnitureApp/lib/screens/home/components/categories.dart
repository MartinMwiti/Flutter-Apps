import 'package:flutter/material.dart';
import 'package:furnitureApp/screens/home/components/category_card.dart';
import 'package:furnitureApp/models/Categories.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // extracted a widget called Categories
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate( // Generates a list of values. In this case list of all categories
          categories.length,
          (index) => CategoryCard(category: categories[index]),
        ),
      ),
    );
  }
}