import 'package:get/get.dart';
import 'package:myinventory/datalayer/http/auth/auth_error.dart';
import 'package:myinventory/datalayer/http/auth/iauth.dart';
import 'package:myinventory/presentation/dependences/dependences.dart';
import 'package:myinventory/ui/pages/pages.dart';

class GetxLoginPresenter extends GetxController implements ILoginPresenter {
  final IValidation validation;
  final IAuth authentication;

  String? _email;
  String? _password;

  var _emailError = RxString('');
  var _passwordError = RxString('');
  var _mainError = RxString('');
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get emailErrorStream => _emailError.stream;
  Stream<String> get passwordErrorStream => _passwordError.stream;
  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxLoginPresenter({required this.validation, required this.authentication});

  void validateEmail(String email) {
    _email = email;
    final _result = validation.validate(field: 'email', value: email);
    _emailError.value = _result == null ? '' : _result;
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    final _result = validation.validate(field: 'password', value: password);
    _passwordError.value = _result == null ? '' : _result;
    _validateForm();
  }

  void _validateForm() {
    _isFormValid.value = _emailError.value.isEmpty == true
    && _passwordError.value.isEmpty == true
    && _email != null
    && _password != null;
  }

  Future<void> auth() async {
    _isLoading.value = true;

      try {
        await authentication.signInWithEmailAndPassword(email: _email.toString(), password: _password.toString());
      } on AuthError catch (error) {
        _mainError.value = error.toString();
      }
      _isLoading.value = false;
  }

  void dispose() {}
}
