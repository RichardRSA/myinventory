import 'package:myinventory/datalayer/cache/cache.dart';
import 'package:myinventory/domain/helpers/domain_error.dart';
import 'package:myinventory/domain/usecases/usecases.dart';

class LocalLoadCurrentAccount implements ILoadAccount {
  final IFetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({required this.fetchSecureCacheStorage});

  Future<String> load() async {
    try {
      final token = await fetchSecureCacheStorage.fetchSecure('token');
      return token;
    } catch (e) {
        throw DomainError.unexpected;
    }
  }
}