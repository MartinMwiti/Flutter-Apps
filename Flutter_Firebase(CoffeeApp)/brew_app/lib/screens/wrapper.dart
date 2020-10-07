import 'package:brew_app/screens/authenticate/authenticate.dart';
import 'package:brew_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // accessing user data using the provider. type of data is User object.
    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
