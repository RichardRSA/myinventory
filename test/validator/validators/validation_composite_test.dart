import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:myinventory/validation/dependences/dependences.dart';
import 'package:myinventory/validation/validators/validators.dart';

class FieldValidationSpy extends Mock implements IFieldValidation {}

void main() {

  late ValidationComposite sut;
  late FieldValidationSpy validationNull;
  late FieldValidationSpy validationEmpty;
  
  void mockValidationNull(String? error){
     when(validationNull.validate(any)).thenReturn(error);
  }

  void mockValidationEmpty(String error){
     when(validationEmpty.validate(any)).thenReturn(error);
  }

  setUp(() {
    validationNull = FieldValidationSpy();
    when(validationNull.field).thenReturn('any_field');
    mockValidationNull(null);

    validationEmpty = FieldValidationSpy();
    when(validationEmpty.field).thenReturn('any_field');
    mockValidationEmpty('');

    sut = ValidationComposite([validationNull, validationEmpty]);
  });

  test('Should return null if all validation returns null or empty', () {
    expect(sut.validate(field: 'any_field', value: 'any_value'), null);
  });

  test('Should return the first error', () {
    mockValidationNull('error_1');
    mockValidationEmpty('error_2');
    expect(sut.validate(field: 'any_field', value: 'any_value'), null);
  });
  
}