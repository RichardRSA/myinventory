import 'package:equatable/equatable.dart';

import 'package:myinventory/validation/dependences/dependences.dart';

class EmailValidation extends Equatable implements IFieldValidation {
  final String? field;

  List get props => [field];

  EmailValidation(this.field);

  String? validate(String? value) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value!);
    return isValid ? null : 'Campo inválido';
  }
}