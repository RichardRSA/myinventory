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

  Future<List<QueryDocumentSnapshot<Object?>>?> getListFilteringValue(
      String filter, String value, String? documentId, int? items) async {
    try {
      items = items == null ? 10 : items;
      QuerySnapshot<Object?> _collection;
      if (documentId == null) {
        _collection = await _getCollectionReference().where(filter, isEqualTo: value).limit(items).get();
      } else {
        final _lastVisible =
            await _getCollectionReference().doc(documentId).get();
        _collection = await _getCollectionReference()
            .startAfter([_lastVisible])
            .where(filter, isEqualTo: value)
            .limit(items)
            .get();
      }
      final _listOfDocuments = _collection.docs;
      if (_listOfDocuments.isNotEmpty) {
        return _listOfDocuments.toList();
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  Future<void> update(
      {required String uid, required Map<String, Object?> document}) async {
    try {
      return await _getCollectionReference().doc(uid).update(document);
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete({required String uid}) async {
    try {
      return await _getCollectionReference().doc(uid).delete();
    } catch (e) {
      throw e;
    }
  }
}
