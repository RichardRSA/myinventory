import 'package:myinventory/main/builders/validation_builders.dart';

import '../../../../presentation/dependences/dependences.dart';
import '../../../../validation/dependences/dependences.dart';
import '../../../../validation/validators/validators.dart';

IValidation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<IFieldValidation> makeLoginValidations() {
  return [
    ... ValidationBuilder.field('email').required().email().build(),
    ... ValidationBuilder.field('password').required().password().build()
  ];
}
