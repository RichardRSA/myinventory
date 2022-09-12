import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/product/product.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IProductPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.nameErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                labelText: 'Nome',
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data),
            onChanged: presenter.validateName,
          );
        });
  }
}
