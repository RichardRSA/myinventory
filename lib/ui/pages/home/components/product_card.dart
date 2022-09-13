import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({ Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: const Text('Product 1'),
            subtitle: Text(
              'Cód: 123456789',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            trailing: Icon(Icons.delete),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/my-inventory-app-b8e4e.appspot.com/o/images%2Fproducts%2FnoImage.png?alt=media&token=b1dd175c-558f-4e74-b09a-bdfcd085652b',
                  width: 360,
                  height: 204,
                  fit: BoxFit.fill)),
        ],
      ),
    );
  }
}
