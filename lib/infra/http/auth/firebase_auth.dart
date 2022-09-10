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
      throw e.code;
    } catch (e) {
      throw AuthError.UNEXPECTED_ERROR;
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
      throw e.code;
    } catch (e) {
      throw AuthError.UNEXPECTED_ERROR;
    }
  }

  Future<void> signOut() {
    try {
      return _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (e) {
      throw AuthError.UNEXPECTED_ERROR;
    }
  }

  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (e) {
      throw AuthError.UNEXPECTED_ERROR;
    }
  }
}
