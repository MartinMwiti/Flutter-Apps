import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/models/Product.dart';

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
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aristocratic Hand Bag',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefaultPaddin * 2.8),
                      Row(
                        children: [
                          // The RichText widget displays text that uses multiple different styles.
                          // TextSpan, which is used to describe the text in a paragraph.
                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(text: "Price\n"),
                              TextSpan(
                                text: "\Ksh ${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          )),
                          SizedBox(width: kDefaultPaddin),
                          Expanded(
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
