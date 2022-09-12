import 'package:flutter/material.dart';

class QuantityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Qnt'),
      obscureText: true,
      keyboardType: TextInputType.number,
    );
  }
}
