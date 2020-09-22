import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ShadowCard(),
  ));
}

class ShadowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Shadow Card'),
      ),
    );
  }
}