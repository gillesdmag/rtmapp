import 'package:firebase_auth/firebase_auth.dart';
import 'package:rtmapp1/models/user.dart';
import 'package:rtmapp1/services/database.dart';

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (exeption) {
      print(exeption.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String name, String email, String phone,
      String status, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseService(user.uid).saveUser(name, phone, status);

        return _userFromFirebaseUser(user);
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (exeption) {
      print(exeption.toString());
      return null;
    }
  }
}
