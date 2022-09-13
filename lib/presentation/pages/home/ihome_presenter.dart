import '../../../domain/entities/entities.dart';

abstract class IHomePresenter {
  Stream<String> get navigateToStream;
  Stream<String> get queryStream;

  void addNew();
  void loadList();
  void goToProductDetails(Product? product);
  void deleteProduct(Product product);
}
