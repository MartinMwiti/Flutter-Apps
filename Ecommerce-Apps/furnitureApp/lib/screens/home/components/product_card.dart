import 'package:flutter/material.dart';
import 'package:furnitureApp/components/title_text.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/models/Product.dart';
import 'package:furnitureApp/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      // wrap product widget so as to navigate to detail page whenever tapped
      onTap: press,
      child: Container(
        // extracted a widget named Products
        width: defaultSize * 14.5, //145
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(defaultSize * 3) //30
            ),
        child: AspectRatio(
          aspectRatio: 0.693, // dictates the dimension of the container
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1, // dictates the dimension of the image
                child: Hero( // Wrapped with Widget called Hero for smooth transition animation
                  tag: product.id,
                  child: new FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: product.image,
                    fit: BoxFit
                        .cover, // BoxFit cover - As small as possible while still covering the entire target box.
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize / 2),
                child: TitleText(title: product.title),
              ),
              SizedBox(height: defaultSize / 2),
              Text('\ksh ${product.price}'),
              //Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a Flex container, like Row or Column.
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
