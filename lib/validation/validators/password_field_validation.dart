import 'package:myinventory/validation/dependences/dependences.dart';

class PasswordValidation implements IFieldValidation {
  final String field;

  PasswordValidation(this.field);

  String? validate(String? value) {
    final regex = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value!);
    return isValid ? null : 'Senha inválida';
  }
}