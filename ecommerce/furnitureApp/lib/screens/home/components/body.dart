import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It enables scrollabling
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Browse by Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}