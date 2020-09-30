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
      padding: EdgeInsets.all(defaultSize * 2), // 20 // spacing between each box inside the Row.
      child: SizedBox( // warpped with Padding
        // Extracted a Widget called CategoryCard
        width: defaultSize * 20.5, //205
        // Aspect ratio is the ratio between the width and height of a box.
        child: AspectRatio(
          aspectRatio: 0.83,
          // The Stack widget allows us to put up multiple layers of widgets onto the screen.
          // The widget takes multiple children and orders them from bottom to top. So the first item is the bottommost and the last is the topmost.
          child: Stack(
            // alignment - How to align the non-positioned and partially-positioned children in the stack.
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
                    // Container - wrapped with ClipPath widget
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
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}


// CustomClipper is the base class for clipping in Flutter and it's used by a four widgets: ClipRect , ClipRRect , ClipOval , ClipPath . Change the height or the width of the Container and it becomes an Oval.
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


// NOTES
// In computer graphics the act of restricting the rendering to a particular area is called Clipping.
// A clip area is supplied to a Canvas so the rendering engine will only “paint” the pixels inside of the defined area. Nothing “painted” outside of that area will be rendered.

// ClipPath is used to create a very custom widget of any shape. ClipPath has a clipper property that requires a custom clipper.
// To create a custom clipper, you need to create a class that extends CustomClipper<Path> and must override two methods.
// The getClip method is called whenever the custom clip needs to be updated and this method has a Size parameter that gives widget height and width values.
// The shouldReclip method is called when a new instance of the class is provided. If the new instance has different information than the old one, then the method should return true, otherwise, it should return false.