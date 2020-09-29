import 'package:flutter/material.dart';
import 'package:furnitureApp/components/title_text.dart';
import 'package:furnitureApp/constants.dart';
import 'package:furnitureApp/models/Categories.dart';
import 'package:furnitureApp/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    // It means we have to add category
    @required this.category
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), // 20
      child: SizedBox( // warpped with Padding
        // Extracted a Widget called CategoryCard
        width: defaultSize * 20.5, //205
        // Aspect ratio is the ratio between the width and height of a box.
        child: AspectRatio(
          aspectRatio: 0.83,
          // The Stack widget allows us to put up multiple layers of widgets onto the screen.
          // The widget takes multiple children and orders them from bottom to top. So the first item is the bottommost and the last is the topmost.
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Container( // 1st Stack
              //   // color: Colors.blueAccent,
              // ),
              // This is custom Shape thats why we need to use ClipPath/
              // ClipPath is used to create a very custom widget of any shape.
              ClipPath(
                // 2nd Stack
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    // wrapped with ClipPath widget
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(
                          title: category.title,
                        ),
                        SizedBox(height: defaultSize),
                        Text("${category.numOfProducts}+ Products",
                            style: TextStyle(color: kTextColor.withOpacity(0.5)))
                      ],
                    ),
                  ),
                ),
              ),
              // Creates a widget that controls where a child of a [Stack] is positioned.
              Positioned(
                  // 3rd Stack
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: new FadeInImage.assetNetwork(
                        placeholder: "assets/spinner.gif", image: category.image),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
