import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:myinventory/domain/helpers/helpers.dart';
import 'package:test/test.dart';

import 'package:myinventory/domain/entities/account_entity.dart';
import 'package:myinventory/domain/usecases/authentication.dart';
import 'package:myinventory/presentation/dependences/dependences.dart';
import 'package:myinventory/presentation/presenters/presenters.dart';

class ValidationSpy extends Mock implements IValidation {}

class AuthenticationSpy extends Mock implements IAuthentication {}

void main() {
  late StreamLoginPresenter sut;
  late AuthenticationSpy authenticationSpy;
  late ValidationSpy validationSpy;
  late String email;
  late String password;

  PostExpectation mockValidationCall(String? field) =>
      when(validationSpy.validate(
          field: field == null ? anyNamed('field') : field,
          value: anyNamed('value')));

  void mockValidationSpy({String? field, String? value}) {
    mockValidationCall(field).thenReturn(value);
  }

  PostExpectation mockAuthenticationCall() => when(authenticationSpy.auth(any));

  void mockAuthenticationSpy() {
    mockAuthenticationCall()
        .thenAnswer((_) async => AccountEntity(faker.guid.guid()));
  }

  void mockAuthenticationSpyError(DomainError error) {
    mockAuthenticationCall().thenThrow(error);
  }

  setUp(() {
    validationSpy = ValidationSpy();
    authenticationSpy = AuthenticationSpy();
    sut = StreamLoginPresenter(
        validation: validationSpy, authentication: authenticationSpy);
    email = faker.internet.email();
    password = faker.internet.password();
    mockValidationSpy();
    mockAuthenticationSpy();
  });

  test('Should call validation with correct email', () {
    sut.validateEmail(email);
    verify(validationSpy.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit email error if validation fails', () {
    mockValidationSpy(value: 'error');
    sut.emailErrorStream
        .listen(expectAsync1((error) => expect(error, 'error')));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));
    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit error if email is null', () {
    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));
    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should call validation with correct password', () {
    sut.validatePassword(password);
    verify(validationSpy.validate(field: 'password', value: password))
        .called(1);
  });

  test('Should emit password error if validation fails', () {
    mockValidationSpy(value: 'error');
    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, 'error')));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));
    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should emit error if password is null', () {
    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));
    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should call validation with correct email and password', () async {
    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, true)));
    expectLater(sut.isFormValidStream, emitsInOrder([false, true]));
    sut.validateEmail(email);
    await Future.delayed(Duration.zero);
    sut.validatePassword(password);
  });

  test('Should call Autehntication with correct values', () async {
    sut.validateEmail(email);
    sut.validatePassword(password);
    await sut.auth();
    verify(authenticationSpy
            .auth(AuthenticationParams(email: email, secret: password)))
        .called(1);
  });

  test('Should emit correct events on Authentication success', () async {
    sut.validateEmail(email);
    sut.validatePassword(password);
    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    await sut.auth();
  });

  test('Should emit correct events on InvalidCredentialsError', () async {
    mockAuthenticationSpyError(DomainError.invalidCredentials);
    sut.validateEmail(email);
    sut.validatePassword(password);
    expectLater(sut.isLoadingStream, emits(false));
    sut.mainErrorStream.listen(
        expectAsync1((error) => expect(error, 'Credentials inválidas.')));
    await sut.auth();
  });

  test('Should emit correct events on UnexpectedError', () async {
    mockAuthenticationSpyError(DomainError.unexpected);
    sut.validateEmail(email);
    sut.validatePassword(password);
    expectLater(sut.isLoadingStream, emits(false));
    sut.mainErrorStream
        .listen(expectAsync1((error) => expect(error, 'Erro inesperado.')));
    await sut.auth();
  });

  test('Should not emit after dispose', () async {
    expectLater(sut.emailErrorStream, neverEmits(null));

    sut.dispose();
    sut.validateEmail(email);
  });
}
