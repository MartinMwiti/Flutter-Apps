import 'package:brew_app/screens/authenticate/authenticate.dart';
import 'package:brew_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // create a constructor
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0,
          title: Text('Sign in to Brew Crew'),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Register"),
              onPressed: () {
                widget.toggleView();
              },
            )
          ]),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            // Build a Form widget using the _formKey created above.
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email is required';
                    }
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!(regex.hasMatch(value))) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Password'),
                  validator: (val) => val.length < 6
                      ? 'Enter a password 6+ characters long'
                      : null,
                  // hide input data e.g password
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20),
                RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.pink[400],
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      // validate() returns true or false based on specified on formField validator
                      if (_formkey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() =>
                              error = 'No user exists with those credentials.');
                        }
                      }
                    }),
                SizedBox(height: 12),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            )),
      ),
    );
  }
}
