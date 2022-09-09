import 'package:firebase_auth/firebase_auth.dart';

import 'package:myinventory/infra/http/auth/auth.dart';

FireAuth makeRemoteAuthentication() {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  return FireAuth(_firebaseAuth);
}
