import 'package:firebase_auth/firebase_auth.dart';

import '../entities/entities.dart';

abstract class IAddAccount {
  Future<UserCredential> add(AddAccountParams params);
}