import '../../validation/dependences/dependences.dart';
import '../../validation/validators/email_field_validaton.dart';
import '../../validation/validators/password_field_validation.dart';
import '../../validation/validators/required_field_validation.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  String fieldName;
  List<IFieldValidation> validations = [];

  ValidationBuilder._(this.fieldName);

  static ValidationBuilder field(String fieldName){
    _instance = ValidationBuilder._(fieldName);
    return _instance!;
  }

  ValidationBuilder required(){
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email(){
    validations.add(EmailValidation(fieldName));
    return this;
  }

  ValidationBuilder password(){
    validations.add(PasswordValidation(fieldName));
    return this;
  }

  List<IFieldValidation> build() => validations;
}