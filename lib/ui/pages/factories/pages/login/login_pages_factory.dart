import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:myinventory/infra/http/auth/firebase_auth.dart';
import 'package:myinventory/presentation/presenters/presenters.dart';
import 'package:myinventory/ui/pages/login/login_page.dart';
import 'package:myinventory/validation/validators/composite_fields_validation.dart';
import 'package:myinventory/validation/validators/email_field_validaton.dart';
import 'package:myinventory/validation/validators/password_field_validation.dart';
import 'package:myinventory/validation/validators/required_field_validation.dart';

Widget makeLoginPage() {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final fireAuth = FireAuth(_firebaseAuth);

  final validationComposite = ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
    PasswordValidation('password'),
  ]);

  final streamLoginPresenter = StreamLoginPresenter(
      authentication: fireAuth, validation: validationComposite);

  return LoginPage(streamLoginPresenter);
}
