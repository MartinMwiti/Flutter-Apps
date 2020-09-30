import 'package:flutter/material.dart';
import 'package:furnitureApp/components/category_card.dart';
import 'package:furnitureApp/components/title_text.dart';
import 'package:furnitureApp/models/Categories.dart';
import 'package:furnitureApp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // SingleChildScrollView - It enables scrollabling
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 2), // 20
            child: TitleText(
                title:
                    "Browse by Categories"), // extracted a widget named TitleText. Moved it into title_text in components makes things cleaner.
          ),
          CategoryCard(category: category) // Occupied previously by SizedBox before extracting widget. Class moved to components dir
        ],
      ),
    );
  }
}

