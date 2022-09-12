import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/product/product.dart';

class PriceInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IProductPresenter>(context);
    return TextFormField(
      decoration: InputDecoration(labelText: 'Preço'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        presenter.setPrice(double.parse(value));
      },
    );
  }
}
