import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/pages/home/home.dart';
import '../../../ui/components/components.dart';
import 'components/components.dart';

class HomePage extends StatelessWidget {
  final IHomePresenter presenter;

  HomePage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        presenter.isLoadingStream.listen((isLoading) {
          if (isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        });

        presenter.mainErrorStream.listen((error) {
          showErrorMessage(context, error);
        });

        presenter.navigateToStream.listen((page) {
          if (page.isNotEmpty == true) {
            Get.offAllNamed(page);
          }
        });

        return SafeArea(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => 
          ProductCard(),
          itemCount: 10,
        ));
      },
    ));
  }
}
