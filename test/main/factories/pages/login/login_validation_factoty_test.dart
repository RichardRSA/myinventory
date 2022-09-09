import 'package:test/test.dart';

import 'package:myinventory/validation/validators/validators.dart';
import 'package:myinventory/main/factories/factories.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeLoginValidations();

    expect(validations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
      PasswordValidation('password')
    ]);
  });
}
