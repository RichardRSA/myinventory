import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/usecases/authentication/authentication.dart';

FireAuth makeRemoteAuthentication() {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  return FireAuth(_firebaseAuth);
}
