import 'package:get/get.dart';

import 'package:myinventory/datalayer/usecases/usecases.dart';

class GetxSplashPresenter implements ISplashPresenter {
  final LocalLoadCurrentAccount loadCurrentAccount;
  var _navigateTo = RxString('');
  Stream<String> get navigateToStream => _navigateTo.stream;
  GetxSplashPresenter({required this.loadCurrentAccount});
  Future<void> checkAccount() async {
    try {
      final _token = await loadCurrentAccount.load();
      _navigateTo.value = _token.isEmpty ? '/login' : '/products';
    } catch (e) {
      _navigateTo.value = '/login';
    }
  }
}

abstract class ISplashPresenter {
  Stream<String> get navigateToStream;
  Future<void> checkAccount();
}
