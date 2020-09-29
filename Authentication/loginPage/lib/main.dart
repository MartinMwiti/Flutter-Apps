import 'package:flutter/material.dart';
import 'package:loginPage/auth/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      home: Scaffold(body: AuthScreen()),
    );
  }
}