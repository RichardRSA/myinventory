import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/http/storage/istorage.dart';

class CloudStorage implements IStorage {
  final FirebaseFirestore _firebaseFirestore;
  final String _reference;

  CloudStorage(this._firebaseFirestore, this._reference);

  CollectionReference _getCollectionReference() {
    return _firebaseFirestore.collection(_reference);
  }

  Future<String> save({required Object document}) async {
    try {
      final _result = await _getCollectionReference().add(document);
      return _result.id;
    } catch (e) {
      throw e;
    }
  }

  Future<Object?> getByUid({required String documentId}) async {
    try {
      final _document = await _getCollectionReference().doc(documentId).get();
      if (_document.exists) {
        return (_document).data();
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  Future<List<QueryDocumentSnapshot<Object?>>?> getList() async {
    try {
      final _query = await _getCollectionReference().get();
      final _listOfDocuments = _query.docs;
      if(_listOfDocuments.isNotEmpty){
        return _listOfDocuments.toList();
      }
      return null;
    } catch (e) {
      throw e;
    }
  }
  
  Future<Object> update({required String uid, required Object document}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<void> delete({required String uid}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  
  

}
