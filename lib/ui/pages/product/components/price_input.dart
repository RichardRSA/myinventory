import 'package:flutter/material.dart';

class PriceInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Preço'),
      obscureText: true,
      keyboardType: TextInputType.number,
    );
  }
}
