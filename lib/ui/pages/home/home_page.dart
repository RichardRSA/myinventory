import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/pages/home/home.dart';
import '../../../domain/entities/entities.dart';
import 'components/components.dart';

const List<Choice> choices = const <Choice>[
  const Choice(title: 'por data', value: 'update'),
  const Choice(title: 'por preço', value: 'price'),
  const Choice(title: 'por nome', value: 'name')
];

class HomePage extends StatelessWidget {
  final IHomePresenter presenter;

  HomePage(this.presenter);

  @override
  Widget build(BuildContext context) {
    _setQuery(Choice value) {
      return FirebaseFirestore.instance
        .collection('products')
        .orderBy(value.value!, descending: true)
        .withConverter<Product>(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (_product, _) => _product.toJson());
    }
    final _query = _setQuery(choices[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus produtos'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          // actions: <Widget>[
          //   PopupMenuButton<Choice>(
          //     icon: const Icon(Icons.sort_rounded),
          //     onSelected: _setQuery,
          //     itemBuilder: (BuildContext context) {
          //       return choices.map((Choice choice) {
          //         return PopupMenuItem<Choice>(
          //           value: choice,
          //           child: Text(choice.title!),
          //         );
          //       }).toList();
          //     },
          //   ),
          // ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: presenter.addNew,
        ),
        body: Builder(builder: (context) {
          presenter.navigateToStream.listen((page) {
            if (page.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });
          return SafeArea(
            child: FirestoreQueryBuilder<Product>(
                query: _query,
                pageSize: 5,
                builder: (context, snapshot, _) {
                  if (snapshot.isFetching) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Algo está errado! ${snapshot.error}');
                  } else {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                        itemCount: snapshot.docs.length,
                        itemBuilder: (context, index) {
                          final hasEndReched = snapshot.hasMore &&
                              index + 1 == snapshot.docs.length &&
                              !snapshot.isFetchingMore;
                          if (hasEndReched) {
                            snapshot.fetchMore();
                          }
                          final _product = snapshot.docs[index].data();
                          return ProductCard(product: _product);
                        });
                  }
                }),
          );
        }));
  }
}
