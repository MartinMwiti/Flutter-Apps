import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar will automatically add a back arrow to take us back to prev screen
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        // elevation: 0 removes the shadow thus making it appear flat
        elevation: 0,
      ),
      body: Text("Choose location screen"),
    );
  }
}