import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../../../presentation/pages/home/home.dart';
import '../../../ui/components/components.dart';
import '../../../domain/entities/entities.dart';

class HomePage extends StatelessWidget {
  final IHomePresenter presenter;

  HomePage(this.presenter);

  final query = FirebaseFirestore.instance.collection('products').withConverter(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (_product, _) => _product.toJson());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus produtos'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.sort_rounded),
              tooltip: 'Data',
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: presenter.addNew,
        ),
        body: Builder(
          builder: (context) {
            presenter.isLoadingStream.listen((isLoading) {
              if (isLoading) {
                showLoading(context);
              } else {
                hideLoading(context);
              }
            });

            presenter.mainErrorStream.listen((error) {
              showErrorMessage(context, error);
            });

            presenter.navigateToStream.listen((page) {
              if (page.isNotEmpty == true) {
                Get.offAllNamed(page);
              }
            });

            return SafeArea(
              child: FirestoreListView<Product>(
                  query: query,
                  // pageSize: 10,
                  itemBuilder: (context, snapShot) {
                    final _product = snapShot.data();
                    return Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(_product.name),
                            subtitle: Text(_product.code,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6))),
                            trailing: Icon(Icons.delete),
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                  imageUrl: _product.image,
                                  width: 360,
                                  height: 204,
                                  fit: BoxFit.fill)),
                        ],
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
