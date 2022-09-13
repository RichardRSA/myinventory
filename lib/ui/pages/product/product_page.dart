import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/pages/product/product.dart';
import '../../components/components.dart';
import 'components/components.dart';

class ProductPage extends StatelessWidget {
  final IProductPresenter presenter;

  ProductPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(body: Builder(builder: (context) {
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

      return Scaffold(
          appBar: AppBar(
            title: Text(''),
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left_sharp),
              onPressed: presenter.goToHome,
              alignment: Alignment.centerLeft,
            ),
          ),
          body: Builder(
            builder: (context) {
              return SafeArea(
                  child: GestureDetector(
                      onTap: _hideKeyboard,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                child: Provider(
                                  create: (_) => presenter,
                                  child: Form(
                                      child: Column(
                                    children: <Widget>[
                                      NameInput(),
                                      CodeInput(),
                                      PriceInput(),
                                      QuantityInput(),
                                      TakePictureButton(),
                                      Padding(
                                          padding: EdgeInsets.only(top: 64),
                                          child: SaveButton()),
                                    ],
                                  )),
                                ))
                          ],
                        ),
                      )));
            },
          ));
    }));
  }
}
