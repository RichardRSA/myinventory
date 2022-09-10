import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/login/login.dart';
import 'package:myinventory/ui/components/components.dart';
import 'package:myinventory/ui/pages/login/components/components.dart';

class LoginPage extends StatelessWidget {
  final ILoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

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
            child: GestureDetector(
                onTap: _hideKeyboard,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      LoginHeader(),
                      Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 16),
                          child: Headline1(text: 'MyInventory')),
                      Padding(
                          padding: EdgeInsets.all(32),
                          child: Provider(
                            create: (_) => presenter,
                            child: Form(
                                child: Column(
                              children: <Widget>[
                                EmailInput(),
                                Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 32),
                                  child: PasswordInput(),
                                ),
                                LoginButton(),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.person),
                                    label: Text('Criar conta'))
                              ],
                            )),
                          ))
                    ],
                  ),
                )));
      },
    ));
  }
}
