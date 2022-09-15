abstract class IFileStorage {
  Future<String> save({required String localFilePath});
  Future<void> delete({required String remoteFilePath});
}
