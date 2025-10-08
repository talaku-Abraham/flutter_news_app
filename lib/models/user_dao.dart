import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class UserDao {
  final FirebaseAuth _auth;

  UserDao(this._auth);

  String errorMessage = 'An error has occured';

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  String? userId() {
    return _auth.currentUser?.uid;
  }

  String? email() {
    return _auth.currentUser?.email;
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseException catch (e) {
      if (email.isEmpty) {
        errorMessage = 'email must be provided';
      } else if (password.isEmpty) {
        errorMessage = 'password must be provided';
      } else if (e.code == "weak-password") {
        errorMessage = 'the password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'the account already exist for that email';
      }

      return errorMessage;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      if (email.isEmpty) {
        errorMessage = 'email must be provided';
      } else if (password.isEmpty) {
        errorMessage = 'password must be provided';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'invalid email';
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        errorMessage = 'Invalid credentials';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'wrong password';
      }
      return errorMessage;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  FutureOr<void> logOut() async {
    await _auth.signOut();
  }
}
