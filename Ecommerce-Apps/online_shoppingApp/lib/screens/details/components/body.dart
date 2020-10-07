import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/models/Product.dart';
import 'package:online_shoppingApp/screens/details/components/add_to_cart.dart';
import 'package:online_shoppingApp/screens/details/components/color_and_size.dart';
import 'package:online_shoppingApp/screens/details/components/counter_with_fav_btn.dart';
import 'package:online_shoppingApp/screens/details/components/description.dart';
import 'package:online_shoppingApp/screens/details/components/product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provides us with the total height and width
    Size size = MediaQuery.of(context).size;
    // SingleChildScrollView - Creates a box in which a single widget can be scrolled.
    // here, i intend to have scrollChild take entire detail body screen as a single widget`
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              // order matters
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.37),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  // height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      CounterWithFavBtn(),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product) // Top most on the Stack
              ],
            ),
          )
        ],
      ),
    );
  }
}

