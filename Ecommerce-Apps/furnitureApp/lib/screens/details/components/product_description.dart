import 'package:flutter/material.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/models/Product.dart';
import 'package:furnitureApp/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      // Extracted widget
      constraints: BoxConstraints(minHeight: defaultSize * 50),
      padding: EdgeInsets.only(
        top: defaultSize * 2.5, // 25
        left: defaultSize * 2, // 20
        right: defaultSize * 2, // 20
      ),
      // height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultSize * 1.2),
            topRight: Radius.circular(defaultSize * 1.2)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 1.5),
            Text(
              product.description,
              style: TextStyle(color: kTextColor.withOpacity(0.7), height: 1.5),
            ),
            SizedBox(height: defaultSize * 1.5),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                // wrapped with SizedBox widget
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.all(defaultSize * 1.5),
                color: kPrimaryColor,
                onPressed: press,
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 1.6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
