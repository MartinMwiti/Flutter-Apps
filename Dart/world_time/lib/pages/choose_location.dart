import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  @override
  // override the original initState from State<ChooseLocation> class
  void initState() {
    super.initState();
    print('initState func run');
  }

  @override
  Widget build(BuildContext context) {
    print('Build func run');
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
      body: RaisedButton(onPressed: () {
        setState(() {
          counter += 1;
        });
      },
      child: Text('Counter is $counter'),
      ),
    );
  }
}
