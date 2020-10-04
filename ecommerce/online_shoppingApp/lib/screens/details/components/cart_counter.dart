import 'package:flutter/material.dart';
import 'package:online_shoppingApp/constraits.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1; //stateless have a final

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if(numOfItems > 1) {
              setState(() => numOfItems --);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less than 10 then it shows 01, 02 etc
            numOfItems.toString().padLeft(2, "0"), // Pads this string on the left if it is shorter than [width] 2.
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() => numOfItems ++);
            }),
      ],
    );
  }

// Reusable code func
  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        // An [EdgeInsets] with zero offsets in each direction.
        padding: EdgeInsets.zero, // centers the icon
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
