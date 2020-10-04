import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        // Extracted a widget
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // makes sure the dim of the container is even by making each container share equally the availabel space. This is due to flex=1
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For demo we use fixed height and width
              // Now we don't need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
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
      ),
    );
  }
}
