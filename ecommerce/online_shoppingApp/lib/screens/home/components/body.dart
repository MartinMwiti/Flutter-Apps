import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/models/Product.dart';
import 'package:online_shoppingApp/screens/details/details_screen.dart';
import 'package:online_shoppingApp/screens/home/components/categories.dart';
import 'package:online_shoppingApp/screens/home/components/item-card.dart';

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
        Categories(), // list name of the categories
        Expanded(
          // default flex=1 each child takes equal spacing
          // Occupied by Column
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2.2),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //SliverGridDelegateWithFixedCrossAxisCount - Creates a delegate that makes grid layouts with a fixed number of tiles in the cross axis.
                  crossAxisCount: 2,
                  mainAxisSpacing:
                      kDefaultPaddin, // The ratio of the cross-axis to the main-axis extent of each child
                  crossAxisSpacing: kDefaultPaddin,
                  // The ratio of the cross-axis to the main-axis extent of each child
                  childAspectRatio: 0.70),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
