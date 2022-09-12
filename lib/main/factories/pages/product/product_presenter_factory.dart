import '../../factories.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../../../presentation/pages/product/product.dart';

IProductPresenter makeGetxProductPresenter() {
  return GetxProductPresenter(
      validation: makeProductValidation(),
      istorage: makeRemoteStore('products'));
}
