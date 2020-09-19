import 'package:flutter/material.dart';

void main() {
  // MaterialApp - root widget
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('TimerApp'),
        backgroundColor: Colors.teal[300],
        // use centerTitle property to align the appBar Title
        centerTitle: true,
      ),
      // Center() widget centalizes whatever is nested inside of it
      body: Center(
        child: Text(
          'Hello MyG',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[600],
          ),
        ),
      ),
      // floatingActionButton sets the button at bottom right.
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green[300],
        child: Text('click'),
      ),
    ),
  )
  );
}

