import 'package:flutter/material.dart';

import 'package:myinventory/ui/pages/pages.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';
import '../../components/components.dart';

class LoginPage extends StatefulWidget {
  final ILoginPresenter presenter;
  LoginPage(this.presenter);

  @override
  State<LoginPage> createState() => _LoginPageState();
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
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}