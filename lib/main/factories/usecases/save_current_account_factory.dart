import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

ISaveCurrentAccount makeLocalSaveCurrentAccount() => LocalSaveCurrentAccount(
  saveSecureCacheStorage: makeSecureStorageAdapter()
);