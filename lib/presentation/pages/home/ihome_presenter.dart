import '../../../domain/entities/entities.dart';

abstract class IHomePresenter {
  Stream<String> get mainErrorStream;
  Stream<String> get navigateToStream;
  Stream<bool> get isLoadingStream;

  void addNew();
  void goToProductDetails(Product? product);
  void deleteProduct(Product product);
  
}