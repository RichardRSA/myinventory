import 'dart:async';

import 'package:myinventory/datalayer/http/auth/auth_error.dart';
import 'package:myinventory/datalayer/http/auth/iauth.dart';
import 'package:myinventory/presentation/dependences/dependences.dart';
import 'package:myinventory/ui/pages/pages.dart';

class LoginState {
  late String email;
  late String password;
  late String emailError;
  late String passwordError;
  late String mainError;
  bool isLoading = false;
  bool get isFormValid =>
      email.isNotEmpty &&
      emailError.isEmpty &&
      password.isNotEmpty &&
      passwordError.isEmpty;
}

class StreamLoginPresenter implements ILoginPresenter {
  final IValidation validation;
  final IAuth authentication;

  var _controller = StreamController<LoginState>.broadcast();
  var _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError).distinct();

  Stream<String> get passwordErrorStream =>
      _controller.stream.map((state) => state.passwordError).distinct();

  Stream<String> get mainErrorStream =>
      _controller.stream.map((state) => state.mainError).distinct();

  Stream<bool> get isFormValidStream =>
      _controller.stream.map((state) => state.isFormValid).distinct();

  Stream<bool> get isLoadingStream =>
      _controller.stream.map((state) => state.isLoading).distinct();

  StreamLoginPresenter(
      {required this.validation, required this.authentication});

  void validateEmail(String email) {
    _state.email = email;
    _state.emailError = validation.validate(field: 'email', value: email)!;
    _controller.add(_state);
  }

  void validatePassword(String password) {
    _state.password = password;
    _state.passwordError =
        validation.validate(field: 'password', value: password)!;
    _controller.add(_state);
  }

  Future<void> auth() async {
    _state.isLoading = true;
    _controller.add(_state);
    try {
      await authentication.signInWithEmailAndPassword(
          email: _state.email, password: _state.password);
    } on AuthError catch (error) {
      _state.mainError = error.toString();
    }
  }

  void dispose() {
    _controller.close();
  }
}
