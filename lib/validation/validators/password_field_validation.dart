import 'package:equatable/equatable.dart';

import 'package:myinventory/validation/dependences/dependences.dart';

class PasswordValidation extends Equatable implements IFieldValidation {
  final String field;

  List get props => [field];

  PasswordValidation(this.field);

  String? validate(String? value) {
    final regex = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value!);
    return isValid ? null : 'Senha inválida';
  }
}