import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IStorage {
  Future<Object?> getByUid({required String documentId});

  Future<List<DocumentSnapshot<Object?>>?> getList();

  Future<String> save({required Object document});

  Future<void> update({
    required String uid,
    required Map<String, Object?> document,
  });

  Future<void> delete({required String uid});
}
