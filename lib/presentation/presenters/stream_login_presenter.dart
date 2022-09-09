// import 'dart:async';

// import 'package:myinventory/datalayer/http/auth/auth_error.dart';
// import 'package:myinventory/datalayer/http/auth/iauth.dart';
// import 'package:myinventory/presentation/dependences/dependences.dart';
// import 'package:myinventory/ui/pages/pages.dart';

// class LoginState {
//   String? email;
//   String? password;
//   late String emailError;
//   late String passwordError;
//   String? mainError;
//   bool isLoading = false;
//   bool get isFormValid => email != null && password != null;
// }

// class StreamLoginPresenter implements ILoginPresenter {
//   final IValidation validation;
//   final IAuth authentication;

//   var _controller = StreamController<LoginState>.broadcast();
//   var _state = LoginState();

//   Stream<String?> get emailErrorStream =>
//       _controller.stream.map((state) => state.emailError).distinct();

//   Stream<String?> get passwordErrorStream =>
//       _controller.stream.map((state) => state.passwordError).distinct();

//   Stream<String?> get mainErrorStream =>
//       _controller.stream.map((state) => state.mainError).distinct();

//   Stream<bool> get isFormValidStream =>
//       _controller.stream.map((state) => state.isFormValid).distinct();

//   Stream<bool> get isLoadingStream =>
//       _controller.stream.map((state) => state.isLoading).distinct();

//   StreamLoginPresenter(
//       {required this.validation, required this.authentication});

//   void validateEmail(String email) {
//     _state.email = email;
//     _state.emailError = validation.validate(field: 'email', value: email)!;
//     _controller.add(_state);
//   }

//   void validatePassword(String password) {
//     _state.password = password;
//     _state.passwordError = validation.validate(field: 'password', value: password)!;
//     _controller.add(_state);
//   }

//   Future<void> auth() async {
//     if (_state.email == null || _state.password == null) {
//       _state.mainError = AuthError.UNEXPECTED_ERROR.toString();
//     } else {
//       _state.isLoading = true;
//       _controller.add(_state);
//       try {
//         await authentication.signInWithEmailAndPassword(email: _state.email.toString(), password: _state.password.toString());
//       } on AuthError catch (error) {
//         _state.mainError = error.toString();
//       }
//       _state.isLoading = false;
//       _controller.add(_state);
//     }
//   }

//   void dispose() {
//     _controller.close();
//   }
// }
