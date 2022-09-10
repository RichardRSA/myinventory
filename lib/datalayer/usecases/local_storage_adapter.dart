import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:myinventory/datalayer/cache/cache.dart';

class LocalStorageAdapter implements ISaveSecureCacheStorage {
  final FlutterSecureStorage flutterSecureStorage;

  LocalStorageAdapter({required this.flutterSecureStorage});

  Future<void> saveSecure(
      {required String? key, required String? value}) async {
    await flutterSecureStorage.write(key: key!, value: value);
  }
}
