import '../../../../presentation/dependences/dependences.dart';
import '../../../../validation/dependences/dependences.dart';
import '../../../../validation/validators/validators.dart';

IValidation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<IFieldValidation> makeLoginValidations() {
  return [
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
    PasswordValidation('password'),
  ];
}
