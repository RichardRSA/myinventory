import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/pages/product/product.dart';

class TakePictureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IProductPresenter>(context);
    return StreamBuilder<String>(
        stream: presenter.imageErrorStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: presenter.pickImage,
            child: const Icon(Icons.camera_alt),
          );
        });
  }
}
