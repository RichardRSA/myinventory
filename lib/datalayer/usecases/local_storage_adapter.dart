import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:myinventory/datalayer/cache/cache.dart';

class LocalStorageAdapter implements ISaveSecureCacheStorage, IFetchSecureCacheStorage {
  final FlutterSecureStorage flutterSecureStorage;

  LocalStorageAdapter({required this.flutterSecureStorage});

  Future<void> saveSecure(
      {required String? key, required String? value}) async {
    await flutterSecureStorage.write(key: key!, value: value);
  }

  Future<String> fetchSecure(String key) async {
    final result = await flutterSecureStorage.read(key: key);
    return result!;
  }
}