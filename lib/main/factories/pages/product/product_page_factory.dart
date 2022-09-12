import 'package:flutter/material.dart';

import '../../../../ui/pages/product/product_page.dart';
import '../pages.dart';

Widget makeProductPage() {
  return ProductPage(makeGetxProductPresenter());
}
