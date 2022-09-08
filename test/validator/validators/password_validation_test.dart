import 'package:test/test.dart';

import 'package:myinventory/validation/validators/validators.dart';

/*
  * ## Excecão - Credenciais inválidas
    1 - login e senha inválidos,
    2 - campos não preenchidos
    3 - requisito de senha inválidos (mínimo 6 caracteres);
*/

void main() {
  late EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if password is empty', () {
    expect(sut.validate(''), null);
  });

  test('Should return null if password is null', () {
    expect(sut.validate(null), null);
  });
   
  test('Should return error if password is invalid', () {
    expect(sut.validate('pass'), 'Senha inválida');
  });

  test('Should return null if password is valid', () {
    expect(sut.validate('1@L]qd4_'), null);
  });
}