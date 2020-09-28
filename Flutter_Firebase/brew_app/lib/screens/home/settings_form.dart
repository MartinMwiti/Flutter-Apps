import 'package:brew_app/models/user.dart';
import 'package:brew_app/services/database.dart';
import 'package:brew_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    // accessing user data using the provider. type of data is User object.
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(
                uid: user
                    .uid // pass in the id that matches the id of the currently logged in user.
                )
            .userData, // userData is the stream name
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  // TextFormField - Creates a [FormField] that contains a [TextField].
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  // dropdown
                  DropdownButtonFormField(
                    // if _currentSugars is not selected/present use '0' as the fallback
                    value: _currentSugars ?? userData.sugars,
                    decoration: textInputDecoration,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(), // .toList() - Creates a [List] containing the elements of this [Iterable]. this is because, 'items' expects a list.
                    onChanged: (val) => setState(() => _currentSugars = val),
                  ),
                  SizedBox(height: 10.0),
                  // slider
                  Slider(
                      min: 100,
                      max: 900,
                      divisions: 8,
                      activeColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      inactiveColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      onChanged: (val) =>
                          setState(() => _currentStrength = val.round())),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        print(_currentName);
                        print(_currentSugars);
                        print(_currentStrength);
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
