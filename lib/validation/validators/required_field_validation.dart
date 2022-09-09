import 'package:equatable/equatable.dart';

import 'package:myinventory/validation/dependences/dependences.dart';

class RequiredFieldValidation extends Equatable implements IFieldValidation {
  final String field;

  List get props => [field];

  RequiredFieldValidation(this.field);

  String? validate(String? value) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório';
  }
}
