import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/signup/signup.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ISignUpPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.signUp : null,
            child: Text('Criar usuário'.toUpperCase()),
          );
        });
  }
}
