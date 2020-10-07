import 'package:flutter/material.dart';
import 'package:furnitureApp/models/Product.dart';
import 'package:furnitureApp/screens/details/components/product_description.dart';
import 'package:furnitureApp/screens/details/components/product_info.dart';
import 'package:furnitureApp/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // SingleChildScrollView - Creates a box in which a single widget can be scrolled.
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape ? SizeConfig.screenWidth : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 35.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 2.5,
              child: Hero( // Wrapped with Widget called Hero for smooth transition animation. Also added it to the product card
                tag: product.id,
                child: Image.network(
                  product.image,
                  height: defaultSize * 37.8, // 378
                  width: defaultSize * 36.4, //364
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
