import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/usecases/storage/storage.dart';
import '../../domain/entities/entities.dart';
import '../pages/home/home.dart';

class GetxHomePresenter extends GetxController implements IHomePresenter {
  final _navigateTo = RxString('');
  final _listOfProducts = Rx<List<Product>>([]);

  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<List<Product>> get listOfProductsStream => _listOfProducts.stream;

  GetxHomePresenter();

  void addNew() {
    _navigateTo.value = '/product';
  }

  void deleteProduct(product) {
    // TODO: implement deleteProduct
  }

  void goToProductDetails(product) {
    // TODO: implement goToProductDetails
  }

  void loadList(choice) async {

    var _filter = 'update';

    if(choice != null){
      _filter = choice.value!;
    }

    CloudStorage _cloudStorage = CloudStorage(FirebaseFirestore.instance, 'products');

    final listOfQueries = await _cloudStorage.getListOrdenedByValue(_filter, true, null, 10);
    
    if(listOfQueries == null || listOfQueries.isEmpty){
      _listOfProducts.value = [];
    }else{
        List<Product> _list = [];
        listOfQueries.forEach((doc) {
            final _data = doc.data();
            _list.add(Product.fromJson(_data as Map<String, dynamic>));
        });
        _listOfProducts.value = _list;
    }

  }
}
