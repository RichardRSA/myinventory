import 'package:myinventory/validation/dependences/dependences.dart';

class RequiredFieldValidation implements IFieldValidation {
  final String field;

  RequiredFieldValidation(this.field);

  String? validate(String? value) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório';
  }
}
