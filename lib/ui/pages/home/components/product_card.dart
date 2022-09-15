import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../domain/entities/entities.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required Product product,
  })  : _product = product,
        super(key: key);

  final Product _product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(_product.name),
            subtitle: Text(_product.code,
                style: TextStyle(color: Theme.of(context).primaryColorDark)),
            trailing: Text(DateTime.fromMillisecondsSinceEpoch(_product.update).toString().substring(0, 19)),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                  imageUrl: _product.image,
                  width: 360,
                  height: 204,
                  fit: BoxFit.fill))
        ],
      ),
    );
  }
}
