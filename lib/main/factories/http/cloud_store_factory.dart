import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/usecases/storage/storage.dart';

CloudStorage makeRemoteStore(String _reference) {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  return CloudStorage(_firebaseFirestore, _reference);
}
