abstract class ISaveSecureCacheStorage {
  Future<void> save({required String key, required String value});
}
