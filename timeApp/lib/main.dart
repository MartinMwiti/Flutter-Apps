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
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset('assets/2.jpg')
            ),
          Expanded(
            flex: 1,
              child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.cyan,
              child: Text('one'),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.blue[200],
              child: Text('two'),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.amber,
              child: Text('three'),
            ),
          )
        ],
      ),
      // floatingActionButton sets the button at bottom right.
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[300],
        child: Text('click'),
      ),
    );
  }
}
