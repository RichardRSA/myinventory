import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/login/login.dart';
import '../../../ui/components/components.dart';
import '../../../ui/pages/login/components/components.dart';

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
                      LogoHeader(),
                      Headline1(text: 'MyInventory'),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Provider(
                            create: (_) => presenter,
                            child: Form(
                                child: Column(
                              children: <Widget>[
                                EmailInput(),
                                PasswordInput(),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton.icon(
                                            onPressed: presenter.goToSignUp,
                                            icon: Icon(Icons.person),
                                            label: Text('Criar conta')))),
                                Padding(
                                    padding: EdgeInsets.only(top: 48),
                                    child: LoginButton()),
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
