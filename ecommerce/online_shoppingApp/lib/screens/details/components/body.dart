import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/models/Product.dart';
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
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.38),
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
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color'),
                              Row(
                                children: [
                                  ColorDot(
                                      color: Color(0xFF356C95),
                                      isSelected: true),
                                  ColorDot(color: Color(0xFFF8C078)),
                                  ColorDot(color: Color(0xFFA29B9B)),
                                ],
                              )
                            ],
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(color: kTextColor),
                                  children: [
                                TextSpan(text: "Size\n"),
                                TextSpan(
                                  text: "${product.size}",
                                  style: Theme.of(context).textTheme.headline5
                                )
                              ])),
                        ],
                      )
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    // By default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Extracted Widget
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        // Border - A uniform border with all sides the same color and width.
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        // DecoratedBox -  Creates a widget that paints a [Decoration].
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
