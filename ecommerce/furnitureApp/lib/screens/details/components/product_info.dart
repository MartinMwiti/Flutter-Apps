import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/models/Product.dart';
import 'package:furnitureApp/size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return Container(
      // EXTRACTED WIDGET
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5, //375
      width: defaultSize * 17, //170
      // color: Colors.black45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(product.category.toUpperCase(), style: lightTextStyle),
          SizedBox(height: defaultSize),
          Text(
            product.title,
            style: TextStyle(
                fontSize: defaultSize * 2.4, // 24
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4),
          ),
          SizedBox(height: defaultSize * 2),
          Text("From", style: lightTextStyle),
          Text(
            "\Ksh ${product.price}",
            style: TextStyle(
                fontSize: defaultSize * 1.6, // 16
                fontWeight: FontWeight.bold,
                height: 1.6),
          ),
          SizedBox(height: defaultSize * 2),
          Text('Available Colors', style: lightTextStyle),
          Row(
            children: [
              buildColorBox(
                defaultSize,
                color: Color(0xFF78A275),
                isActive: true
              ), // occupied by Container
              buildColorBox(defaultSize, color: Color(0xFFD7D7D7)),
              buildColorBox(defaultSize, color: kTextColor),
            ],
          ),
        ],
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color color, bool isActive = false}) {
    return Container(
      // Extracted a method.
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      // For fixed value we can use const for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: isActive ? SvgPicture.asset('assets/icons/check.svg') : SizedBox(),
    );
  }
}
