abstract class ICamera {
  Future<dynamic> fetch(String key);
  Future<void> delete(String key);
  Future<void> save({ required String key, required dynamic value });
}