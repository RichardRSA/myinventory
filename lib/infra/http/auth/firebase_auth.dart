import 'package:firebase_auth/firebase_auth.dart';

import 'package:myinventory/datalayer/http/auth/auth_error.dart';
import 'package:myinventory/datalayer/http/auth/iauth.dart';

class FireAuth implements IAuth {
  final FirebaseAuth _firebaseAuth;

  FireAuth(this._firebaseAuth);

  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword( 
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        throw AuthError.ERROR_EMAIL_ALREADY_IN_USE;
      } else {
        throw AuthError.UNEXPECTED_ERROR;
      }
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD') {
        throw AuthError.ERROR_WRONG_PASSWORD;
      } else if (e.code == 'ERROR_USER_NOT_FOUND') {
        throw AuthError.ERROR_USER_NOT_FOUND;
      } else {
        throw AuthError.UNEXPECTED_ERROR;
      }
    }
  }

  Future<void> signOut() {
    try {
      return _firebaseAuth.signOut();
    } catch (e){
      throw AuthError.UNEXPECTED_ERROR;
    }
  }

  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      throw AuthError.UNEXPECTED_ERROR;
    }
  }
}