import 'package:flutter/material.dart';

class BezierCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ClipPath(
            child: Image.asset('assets/1.jpg'),
            clipper: MyBezierClipper(),
          ),
        ),
      ),
    );
  }
}

class MyBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // size takes the size of(child) what's inside our ClipPath. in our case Image.
    var path =
        Path(); // path helps get our desired portion of the image by drawing line over our image.

    path.lineTo(0, size.height - 20);

    var firstEndPoint = new Offset(size.width/2.25, size.height - 30);
    var firstControlPoint = new Offset(size.width/4, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = new Offset(size.width, size.height - 40);
    var secondControlPoint = new Offset(size.width - (size.width/3.25), size.height - 65);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close(); // go back to initial point.

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
