import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:myinventory/datalayer/usecases/usecases.dart';
import 'package:myinventory/domain/helpers/domain_error.dart';
import 'package:myinventory/datalayer/cache/cache.dart';

class SaveSecureCacheStorageSpy extends Mock implements ISaveSecureCacheStorage {}

void main() {
  late LocalSaveAccount sut;
  late SaveSecureCacheStorageSpy saveSecureCacheStorage;
  late String token;

  void mockError() =>
    when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value')))
      .thenThrow(Exception());

  setUp(() {
    saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    sut = LocalSaveAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    token = faker.guid.guid();
  });

  test('Should call SaveSecureCacheStorage with correct values', () async {
    await sut.save(token);

    verify(saveSecureCacheStorage.saveSecure(key: 'token', value: token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws', () async {
    mockError();

    final future = sut.save(token);

    expect(future, throwsA(DomainError.unexpected));
  });
}