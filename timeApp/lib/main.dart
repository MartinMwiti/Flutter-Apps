import 'package:flutter/material.dart';

void main() {
  // MaterialApp - root widget
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimerApp'),
        backgroundColor: Colors.teal[300],
        // use centerTitle property to align the appBar Title
        centerTitle: true,
      ),
      // Center() widget centalizes whatever is nested inside of it
      body: Center(
          child: IconButton(
              icon: Icon(Icons.alternate_email),
              color: Colors.amber,
              onPressed: () {
                print('You clicked');
              })),
      // floatingActionButton sets the button at bottom right.
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[300],
        child: Text('click'),
      ),
    );
  }
}
