import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shoppingApp/constraits.dart';
import 'package:online_shoppingApp/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body()
    );
  }

  AppBar buildAppBar() {
    return AppBar( // extract method
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon:
              SvgPicture.asset('assets/icons/search.svg', color: kTextColor),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart.svg',
              color: kTextColor),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
