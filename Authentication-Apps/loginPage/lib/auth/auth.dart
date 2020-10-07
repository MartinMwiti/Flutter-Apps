import 'package:flutter/material.dart';
import 'package:loginPage/background_painter.dart';

class AuthScreen extends StatefulWidget {
  // super is used to call the constructor of the base class.
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Creates a box that will become as large as its parent allows.
          SizedBox.expand(
            child: CustomPaint(
              // Creates a widget that delegates its painting.
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          )
        ],
      ),
    );
  }
}
