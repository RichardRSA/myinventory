import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/pages/home/home.dart';
import '../../../domain/entities/entities.dart';
import 'components/components.dart';

List<Choice> choices = <Choice>[
  Choice(title: 'por data', value: 'update'),
  Choice(title: 'por preço', value: 'price'),
  Choice(title: 'por nome', value: 'name')
];

class HomePage extends StatelessWidget {
  final IHomePresenter presenter;

  HomePage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.loadList(choices[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus produtos'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton<Choice>(
              icon: const Icon(Icons.sort_rounded),
              onSelected: presenter.loadList,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Text(choice.title!),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
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
              child: StreamBuilder<List<Product>>(
                  stream: presenter.listOfProductsStream,
                  initialData: [],
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      final _list = snapshot.data;
                      return ListView.builder(
                          itemCount: _list == null ? 0 : _list.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            final _element = _list![index];
                            return ProductCard(product: _element);
                          });
                    } else if (snapshot.hasError) {
                      return Text('Algo está errado! ${snapshot.error}');
                    } else {
                      return Text('Algo está errado!');
                    }
                  }));
        }));
  }
}
