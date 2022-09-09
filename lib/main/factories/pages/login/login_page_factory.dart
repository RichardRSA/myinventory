import 'package:flutter/material.dart';

import 'package:myinventory/ui/pages/login/login_page.dart';
import '../../factories.dart';

Widget makeLoginPage() {
  return LoginPage(makeLoginPresenter());
}
