import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myinventory/ui/components/components.dart';
import 'package:myinventory/ui/pages/login/components/components.dart';
import 'package:myinventory/ui/pages/pages.dart';

class LoginPage extends StatefulWidget {
  final ILoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        widget.presenter.isLoadingStream.listen((isLoading) {
          if (isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        });

        widget.presenter.mainErrorStream.listen((error) {
          showErrorMessage(context, error);
        });

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LoginHeader(),
              Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Headline1(text: 'MyInventory')),
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Provider(
                    create: (_) => widget.presenter,
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
        );
      },
    ));
  }
}
