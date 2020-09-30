import 'package:flutter/material.dart';
import 'package:furnitureApp/components/category_card.dart';
import 'package:furnitureApp/components/title_text.dart';
import 'package:furnitureApp/models/Categories.dart';
import 'package:furnitureApp/services/fetchCategories.dart';
import 'package:furnitureApp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // SingleChildScrollView - It enables scrollabling
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 2), // 20
            child: TitleText(
                title:
                    "Browse by Categories"), // extracted a widget named TitleText. Moved it into title_text in components makes things cleaner.
          ),
          // How to wait for your async tasks before building widgets?
          // Widget that builds itself based on the latest snapshot of interaction with a Future.
          // It means the builder() waits for the future value before building the widgets.
          FutureBuilder(
              future:
                  fetchCategories(), // func that gets the data from API. It returns list of categories
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot
                          .data) // Occupied previously by SingleChildScrollView before extracting widget. Added it inside FutureBuilder. Class moved to components dir
                  : CircularProgressIndicator()),
        ],
      ),
    );
  }
}

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
