import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash.dart';

class SplashPage extends StatelessWidget {
  final ISplashPresenter presenter;
  SplashPage({required this.presenter});
  @override
  Widget build(BuildContext context) {
    presenter.navigateToStream.listen((page) {
      if (page.isNotEmpty == true) {
        Get.offAllNamed(page);
      }
    });
    return Scaffold(
        appBar: AppBar(title: Text('MyInventory')),
        body: Builder(builder: (context) {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
