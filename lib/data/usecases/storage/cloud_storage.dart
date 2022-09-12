import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/http/storage/istorage.dart';

class CloudStorage implements IStorage {
  final FirebaseFirestore _firebaseFirestore;
  final String _reference;

  CloudStorage(this._firebaseFirestore, this._reference);

  Future<String> save({required Object document}) async {
    try {
      CollectionReference _collectionReference =
          _firebaseFirestore.collection(_reference);
      return (await _collectionReference.add(document)).id;
    } catch (e) {
      throw e;
    }
  }

  Future<Object?> getByUid({required String documentId}) async {
    try {
      CollectionReference _collectionReference =
          _firebaseFirestore.collection(_reference);
      final _document = await _collectionReference.doc(documentId).get();
      if (_document.exists) {
        return (_document).data();
      }
      return null;
    } catch (e) {
      throw e;
    }
  }
  
  @override
  Future<void> delete({required String uid}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<DocumentSnapshot<Object?>> getList({required String uid}) {
    // TODO: implement getList
    throw UnimplementedError();
  }
  
  @override
  Future<Object> update({required String uid, required Object document}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
