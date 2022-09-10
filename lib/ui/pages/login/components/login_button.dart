import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/login/login.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ILoginPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.auth : null,
            child: Text('Entrar'.toUpperCase()),
          );
        });
  }
}
