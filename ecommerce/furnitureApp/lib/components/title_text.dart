import 'package:flutter/material.dart';
import 'package:furnitureApp/size_config.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    this.title //updated
  }) : super(key: key);

  final String title; //updated

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize; 
    return Text(
        title,
        style: TextStyle(
            fontSize: defaultSize * 1.6, // 16
            fontWeight: FontWeight.bold)
    );
  }
}
