import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/models/Product.dart';
import 'package:online_shoppingApp/screens/home/components/categories.dart';

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
              itemBuilder: (context, index) =>
                  ItemCard(product: products[index]),
            ),
          ),
        )
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // Extracted a widget
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded( // makes sure the dim of the container is even by making each container share equally the availabel space. This is due to flex=1
          child: Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            // For demo we use fixed height and width
            // Now we don't need them
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
                color: product.color, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(product.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            products[0].title,
            style: TextStyle(color: kTextColor),
          ),
        ),
        Text("\Ksh ${product.price}",
            style: TextStyle(
                fontWeight: FontWeight.bold)) // products is our demo list
      ],
    );
  }
}
