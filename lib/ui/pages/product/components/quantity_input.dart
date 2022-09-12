import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/product/product.dart';

class QuantityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IProductPresenter>(context);
    return TextFormField(
      decoration: InputDecoration(labelText: 'Quantidade'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        presenter.setQuantity(int.parse(value));
      },
    );
  }
}
