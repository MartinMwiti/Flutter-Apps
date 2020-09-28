import 'package:brew_app/models/brew.dart';
import 'package:brew_app/screens/home/brew_list.dart';
import 'package:brew_app/screens/home/settings_form.dart';
import 'package:brew_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          // Widgets to display in a row after the [title] widget.
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("Logout")),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Settings'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
