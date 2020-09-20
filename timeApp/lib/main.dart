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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Was brackin'),
          FlatButton(
            onPressed: (){}, 
            color: Colors.amber,
            child: Text('click')
          ),
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.all(30),
            child: Text('Inside container'),
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
