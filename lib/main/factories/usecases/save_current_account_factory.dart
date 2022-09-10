import '../../../datalayer/usecases/usecases.dart';
import '../factories.dart';

LocalSaveAccount makeLocalSaveCurrentAccount() {
  return LocalSaveAccount(saveSecureCacheStorage: makeLocalStorageAdapter());
}