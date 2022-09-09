import 'package:firebase_auth/firebase_auth.dart';

abstract class SaveCurrentAccount {
  Future<void> save(User user);
}