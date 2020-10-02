import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            'Women',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories()
      ],
    );
  }
}

// We need a stateful widget for the categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // initial state
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      // Creates a scrollable, linear array of widgets that are created on demand.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount - Providing a non-null itemCount improves the ability of the [ListView] to estimate the maximum scroll extent.
        itemCount: categories.length,
        // The itemBuilder callback will be called only with indices greater than or equal to zero and less than itemCount.
        itemBuilder: (context, index) =>
            buildCategory(index), // extracted a method
      ),
    );
  }

  // Widgets themselves have no mutable state (all their fields must be final). If you wish to associate mutable state with a widget,
  // build for each index of the category
  // Changed the type of the extracted method from Text to Widget since we're dealing with more than Text type.
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), // top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
