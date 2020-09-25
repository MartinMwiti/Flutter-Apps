import 'package:brew_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // accessing user data from the provider. type of data is User
    final user = Provider.of<User>(context);
    print(user);

    // return either Home or Authenticate widget
    return Authenticate();
  }
}
