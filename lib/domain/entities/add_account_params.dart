import 'package:equatable/equatable.dart';

class AddAccountParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;

  List get props => [name, email, password, passwordConfirm];

  AddAccountParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirm});
}
