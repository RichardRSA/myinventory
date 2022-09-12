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
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus produtos'),
          backgroundColor: Color.fromRGBO(53, 73, 94, 0.9),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.sort_rounded),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          backgroundColor: Color.fromRGBO(53, 73, 94, 0.9),
          onPressed: () {
            // TODO add your logic here to add stuff
          },
        ),
        body: Builder(
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
              itemBuilder: (BuildContext context, int index) => ProductCard(),
              itemCount: 10,
            ));
          },
        ));
  }
}
