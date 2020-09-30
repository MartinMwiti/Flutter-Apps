import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/models/Product.dart';

class DetailsScreen extends StatelessWidget {
  // That means we have to pass it(product)
  const DetailsScreen({Key key, @required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: SvgPicture.asset('assets/icons/arrow-long-left.svg'),
            onPressed: () {
              // close/remove the widget from the tree
              Navigator.pop(context);
            }),
            actions: [
              IconButton(
                icon: SvgPicture.asset('assets/icons/bag.svg'), 
                onPressed: (){}
              )
            ],
      ),
    );
  }
}
