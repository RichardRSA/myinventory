import 'package:get/get.dart';

import '../pages/home/home.dart';

class GetxHomePresenter extends GetxController implements IHomePresenter {

  var _mainError = RxString('');
  var _navigateTo = RxString('');
  var _isLoading = false.obs;

  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxHomePresenter();
  
  void addNew() {
    _navigateTo.value = '/product';
  }
  
  @override
  void deleteProduct(product) {
    // TODO: implement deleteProduct
  }
  
  @override
  void goToProductDetails(product) {
    // TODO: implement goToProductDetails
  }

}