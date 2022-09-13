import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/signup/signup.dart';
import '../../data/http/auth/iauth.dart';
import '../../domain/usecases/isave_account.dart';
import '../../presentation/dependences/dependences.dart';

class GetxSignUpPresenter extends GetxController implements ISignUpPresenter {
  final IValidation validation;
  final IAuth authentication;
  final ISaveCurrentAccount saveAccount;

  String? _email;
  String? _password;
  String? _confirmPassword;

  var _emailError = RxString('');
  var _passwordError = RxString('');
  var _confirmPasswordError = RxString('');
  var _mainError = RxString('');
  var _navigateTo = RxString('');
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get emailErrorStream => _emailError.stream;
  Stream<String> get passwordErrorStream => _passwordError.stream;
  Stream<String> get confirmPasswordErrorStream => _confirmPasswordError.stream;
  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxSignUpPresenter(
      {required this.validation,
      required this.authentication,
      required this.saveAccount});

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

  void validateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    var _result =
        validation.validate(field: 'confirmPassword', value: confirmPassword);

    if (_password != confirmPassword) {
      _result = 'Senhas não conferem';
    }

    _confirmPasswordError.value = _result == null ? '' : _result;

    _validateForm();
  }

  void _validateForm() {
    _isFormValid.value = _emailError.value.isEmpty == true &&
        _passwordError.value.isEmpty == true &&
        _confirmPasswordError.value.isEmpty == true &&
        _email != null &&
        _password != null &&
        _confirmPassword != null;
  }

  Future<void> signUp() async {
    _mainError.value = '';

    _isLoading.value = true;

    try {
      UserCredential userCredential =
          await authentication.createUserWithEmailAndPassword(
              email: _email.toString(), password: _password.toString());

      final _token = await userCredential.user?.getIdToken();

      await saveAccount.save(_token!);

      _navigateTo.value = '/home';
    } catch (e) {
      _mainError.value = e.toString();
      _isLoading.value = false;
    }
  }

  // void dispose() {}

  void goToLogin() {
    _navigateTo.value = '/login';
  }
}
