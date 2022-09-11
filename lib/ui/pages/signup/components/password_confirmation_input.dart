import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/signup/signup.dart';

class PasswordConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ISignUpPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.confirmPasswordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                icon: Icon(Icons.lock,
                    color: Theme.of(context).primaryColorLight),
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data),
            obscureText: true,
            onChanged: presenter.validateConfirmPassword,
          );
        });
  }
}
