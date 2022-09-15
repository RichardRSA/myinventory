import 'package:cached_network_image/cached_network_image.dart';
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
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  trailing: Icon(Icons.delete),
                  onTap: presenter.deleteImage,
                ),
                StreamBuilder<String>(
                    stream: presenter.pictureImageStream,
                    builder: (context, pictureSnapshot) {
                      if (pictureSnapshot.hasData &&
                          Uri.parse(pictureSnapshot.data!).isAbsolute) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                                imageUrl: pictureSnapshot.data!,
                                width: 360,
                                height: 204,
                                fit: BoxFit.fill));
                      } else {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: ElevatedButton(
                              onPressed: presenter.pickImage,
                              child: const Icon(Icons.camera_alt),
                            ));
                      }
                    }),
              ],
            ),
          );
        });
  }
}
