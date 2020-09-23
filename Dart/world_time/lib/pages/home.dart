import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// state object
class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // get the argument sent in the loading page
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          FlatButton.icon(
              onPressed: () {
                // Navigator help push to another route/screen
                // it's 'named' because i'll supply a named route.
                // it's called 'push' bacause it essentially i'm pushing another scrren on top of another
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit location'))
        ],
      )),
    );
  }
}
