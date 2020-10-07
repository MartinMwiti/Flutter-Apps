import 'package:flutter/material.dart';
import 'package:furnitureApp/screens/home/components/categories.dart';
import 'package:furnitureApp/components/title_text.dart';
import 'package:furnitureApp/screens/home/components/recommend_products.dart';
import 'package:furnitureApp/services/fetchCategories.dart';
import 'package:furnitureApp/services/fetchProducts.dart';
import 'package:furnitureApp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // SingleChildScrollView - It enables scrollabling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          // Creates a vertical array of children.
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
                        // Occupied previously by SingleChildScrollView before extracting widget. Added it inside FutureBuilder. Class moved to components dir
                        categories: snapshot.data)
                    : Center(child: new Image.asset('assets/ripple.gif'))),

            Divider(height: defaultSize * 0.5), //5

            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(
                title: 'Recommends For You',
              ),
            ),
            // Right now product is our demo product

            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) => snapshot.hasData
                // print(snapshot.data);
                ? RecommendProduct(products: snapshot.data)  // previosly occupied by Padding/Gridview
                : Center(child: new Image.asset('assets/ripple.gif'))
            )
          ],
        ),
      ),
    );
  }
}

