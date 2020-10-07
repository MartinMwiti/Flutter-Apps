import 'package:flutter/material.dart';
import 'package:furnitureApp/models/Product.dart';
import 'package:furnitureApp/screens/details/detail_screen.dart';
import 'package:furnitureApp/screens/home/components/product_card.dart';
import 'package:furnitureApp/size_config.dart';

class RecommendProduct extends StatelessWidget {
  const RecommendProduct({
    Key key,
    this.products,
  }) : super(key: key);
  // Because our API provides us a list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      //  extracted widget
      padding: EdgeInsets.all(defaultSize * 2), //20
      // GridView Widget is used when we have to display something on a Grid.
      child: GridView.builder(
          // we just turn off grid view scrolling
          shrinkWrap: true, // helps the child to take only the sapce it needs
          physics: NeverScrollableScrollPhysics(),
          // just for demo
          itemCount: products.length,
          // gridDelegate -  A delegate that controls the layout of the children within the [GridView].
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.693,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: SizeConfig.orientation == Orientation.portrait
                ? 2
                : 4, // No of items in the grid on our crossAxis
          ),
          itemBuilder: (context, index) => ProductCard(
              product: products[index],
              press: () {
                // use a MaterialPageRoute , which is useful because it transitions to the new route using a platform-specific animation.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: products[index]),)
                );
              })),
    );
  }
}

// NOTES
// GridView.count() is one which is used frequently and it is used when we already know the size of Grids. Whenever we have to implement GridView dynamically, we use GridView.builder().
// shrinkWrap - Creates a scrollable, 2D array of widgets that are created on demand.
// physics: It determines how the list of widgets behave when the user reaches the end or the start of widget while scrolling. --- NeverScrollableScrollPhysics - Creates scroll physics that does not let the user scroll.
// SliverGridDelegateWithFixedCrossAxisCount - Creates a delegate that makes grid layouts with a fixed number of tiles in the cross axis.
// crossAxisCount: It defines the number of columns in GridView.
// crossAxisSpacing: It defines the number pixels between each child listed along the cross axis.
// mainAxisSpacing: It defines the number of pixels between each child listed along the main axis.
// itemBuilder - This constructor is appropriate for grid views with a large (or infinite) number of children because the builder is called only for those children that are actually visible.
