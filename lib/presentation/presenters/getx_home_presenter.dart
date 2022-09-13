import 'package:get/get.dart';

import '../pages/home/home.dart';

class GetxHomePresenter extends GetxController implements IHomePresenter {
  var _navigateTo = RxString('');
  var _query = RxString('update');

  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<String> get queryStream => _query.stream;

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

  void loadList() {

  }
}
