import '../../../data/cache/cache.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements ISaveCurrentAccount {
  final ISaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({ required this.saveSecureCacheStorage });

  Future<void> save(String token) async {
    try {
      await saveSecureCacheStorage.save(key: 'token', value: token);
    } catch(error) {
      throw DomainError.unexpected;
    }
  }
}