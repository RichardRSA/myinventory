import '../../../../main/builders/validation_builders.dart';
import '../../../../presentation/dependences/dependences.dart';
import '../../../../validation/dependences/dependences.dart';
import '../../../../validation/validators/validators.dart';

IValidation makeProductValidation() {
  return ValidationComposite(makeProductValidations());
}

List<IFieldValidation> makeProductValidations() {
  return [
    ...ValidationBuilder.field('name').required().build(),
    ...ValidationBuilder.field('code').required().build(),
    ...ValidationBuilder.field('price').build(),
    ...ValidationBuilder.field('quantity').build(),
  ];
}