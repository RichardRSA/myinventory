import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache/cache.dart';

class SecureStorageAdapter implements ISaveSecureCacheStorage, IFetchSecureCacheStorage, IDeleteSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({required this.secureStorage});

  Future<void> save({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> fetch(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await secureStorage.delete(key: key);
  }
}