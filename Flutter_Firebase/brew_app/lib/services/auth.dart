import 'package:brew_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); // same as above code
  }

  // Sign in anonymously
  Future signInAnon() async {
    try {
      // AuthResult - Result object obtained from operations that can affect the authentication state. Contains a method that returns the currently signed-in [FirebaseUser] user after the operation has completed.
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with Email and Password

  // Register with Email and Password

  // Sign Out

}
