import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'home.dart';

Widget makeHomePage() {
  return HomePage(makeGetxHomePresenter());
}
