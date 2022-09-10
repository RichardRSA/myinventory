import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../cache/cache.dart';

class LocalSaveAccount implements ISaveAccount {
  final ISaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveAccount({required this.saveSecureCacheStorage});

  Future<void> save(String token) async {
    try {
      await saveSecureCacheStorage.saveSecure(key: 'token', value: token);
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
