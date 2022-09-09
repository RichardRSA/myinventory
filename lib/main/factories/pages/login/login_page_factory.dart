import 'package:flutter/material.dart';
import 'package:myinventory/main/factories/pages/login/login.dart';

import 'package:myinventory/ui/pages/login/login_page.dart';

Widget makeLoginPage() {
  return LoginPage(makeGetxLoginPresenter());
}
