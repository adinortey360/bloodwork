import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BloodworkFirebaseUser {
  BloodworkFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

BloodworkFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BloodworkFirebaseUser> bloodWorkFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<BloodworkFirebaseUser>(
        (user) => currentUser = BloodworkFirebaseUser(user));
