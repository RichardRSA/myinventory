import '../../../data/cache/cache.dart';
import '../../../domain/helpers/domain_error.dart';
import '../../../domain/usecases/usecases.dart';

class LocalLoadCurrentAccount implements ILoadCurrentAccount {
  final IFetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({ required this.fetchSecureCacheStorage });

  Future<String> load() async {
    try {
      final token = await fetchSecureCacheStorage.fetch('token');
      if (token == null) throw Error();
      return token;
    } catch(error) {
      throw DomainError.unexpected;
    }
  }
}