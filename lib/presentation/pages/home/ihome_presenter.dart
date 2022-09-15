import '../../../domain/entities/entities.dart';

abstract class IHomePresenter {
  Stream<String> get navigateToStream;
  Stream<List<Product>> get listOfProductsStream;

  void addNew();
  void loadList(Choice? choice);
  void goToProductDetails(Product? product);
  void deleteProduct(Product product);
}
