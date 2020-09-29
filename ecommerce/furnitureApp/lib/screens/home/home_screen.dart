import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/screens/home/components/body.dart';
import 'package:furnitureApp/size_config.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It help us to make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(), // extracted a method - func. makes things cleaner
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: new SvgPicture.asset('assets/icons/menu.svg', height: SizeConfig.defaultSize * 2, //20
          ),
          onPressed: () {}
      ),
      actions: [
        IconButton(
          icon: new SvgPicture.asset('assets/icons/scan.svg', height: SizeConfig.defaultSize * 2.4, //24
          ), 
          onPressed: (){}
        ),
        Center(child: Text('Scan', style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold)),),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}

