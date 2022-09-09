import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:myinventory/domain/helpers/domain_error.dart';
import 'package:myinventory/domain/usecases/save_account.dart';

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

abstract class ISaveSecureCacheStorage  {
  Future<void> saveSecure({required String? key, required String? value});
}

class SaveSecureCacheStorageSpy extends Mock implements ISaveSecureCacheStorage {}

void main() {

  late SaveSecureCacheStorageSpy saveSecureCacheStorage;
  late LocalSaveAccount sut;
  late String token;

  setUp(() {
    saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    sut = LocalSaveAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    token = faker.guid.guid();
  });

  test('Should call Save CacheStorage with correct values', () async {
    await sut.save(token);
    verify(saveSecureCacheStorage.saveSecure(key: 'token', value: token));
  });

  test('Should throw Unexpected error', () async {
    when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value')))
    .thenThrow(Exception());

    final future = sut.save(token);

    expect(future, throwsA(DomainError.unexpected));
  });

}
