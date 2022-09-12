import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/http/auth/iauth.dart';

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
      throw e.toString();
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
      throw e.toString();
    }
  }

  Future<void> signOut() {
    try {
      return _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }
}
