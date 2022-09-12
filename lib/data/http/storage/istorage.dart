import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/entities.dart';

abstract class IStorage {
  Future<Object?> getByUid({required String documentId});

  Future<DocumentSnapshot<Object?>> getList({required String uid});

  Future<String> save({required Object document});

  Future<Object> update({
    required String uid,
    required Object document,
  });

  Future<void> delete({required String uid});
}
