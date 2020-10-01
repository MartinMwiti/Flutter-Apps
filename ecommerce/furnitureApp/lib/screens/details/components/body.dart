import 'package:flutter/material.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/models/Product.dart';
import 'package:furnitureApp/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            height: defaultSize * 37.5, //375
            width: defaultSize * 15, //150
            // color: Colors.black45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.category.toUpperCase(),
                  style: lightTextStyle
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
