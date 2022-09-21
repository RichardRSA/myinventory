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
    presenter.loadList(Choice(title: 'por data', value: 'update'));
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
              child: StreamBuilder<List<Product>>(
                  stream: presenter.listOfProductsStream,
                  initialData: [],
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      final _list = snapshot.data;
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: Colors.black),
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
