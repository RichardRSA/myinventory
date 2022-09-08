import '../../presentation/dependences/dependences.dart';
import '../dependences/dependences.dart';

class ValidationComposite implements IValidation {
  final List<IFieldValidation> validations;
    ValidationComposite(this.validations)
    String? validate({required String field, required String value}){
      String? error;
      for(final validation in validations.where((element) => element.field == field)){
        error = validation.validate(value);
        if(error?.isNotEmpty == true){
          return error;
        }
      }
      return error;
    }
}