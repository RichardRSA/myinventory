import 'package:get/get.dart';

import '../pages/product/product.dart';
import '../../presentation/dependences/dependences.dart';
import '../../../domain/entities/product.dart';
import '../../../data/http/storage/istorage.dart';

class GetxProductsPresenter extends GetxController implements IProductPresenter {
  final IValidation validation;
  final IStorage istorage;

  String? _uid;
  String? _name;
  String? _code;
  String? _image;
  late double _price;
  late int _quantity;

  var _nameError = RxString('');
  var _codeError = RxString('');
  var _priceError = RxDouble(0);
  var _quantityError = RxInt(0);
  var _imageError = RxString('');

  var _mainError = RxString('');
  var _navigateTo = RxString('');

  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get nameErrorStream => _nameError.stream;
  Stream<String> get codeErrorStream => _codeError.stream;
  Stream<double> get priceErrorStream => _priceError.stream;
  Stream<int> get quantityErrorStream => _quantityError.stream;
  Stream<String> get imageErrorStream => _imageError.stream;

  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxProductsPresenter({
    required this.validation,
    required this.istorage
  });

  void _validateForm() {
    _isFormValid.value = _nameError.value.isEmpty == true &&
    _codeError.value.isEmpty == true &&
    _name != null &&
    _code != null;
  }

  void save() async {

    _mainError.value = '';
    _isLoading.value = true;

    try {

      Product _product = Product(
        name: _name!, 
        code: _code!, 
        update: DateTime.now().millisecondsSinceEpoch, 
        price: _price,
        quantity: _quantity,
        image: _image
      );

      if(_uid == null){
        await istorage.save(document: _product);
      }else{
        await istorage.update(uid: _uid!, document: _product.toJson());
      }

      _navigateTo.value = '/home';

    } catch (e) {

      _mainError.value = e.toString();
      _isLoading.value = false;

    }
  }

  void validateName(String name) {
    _name = name;
    var _result = validation.validate(field: 'name', value: name);
    _nameError.value = _result == null ? '' : _result;
    _validateForm();
  }

  void validateCode(String code) {
    _code = code;
    var _result = validation.validate(field: 'code', value: code);
    _codeError.value = _result == null ? '' : _result;
    _validateForm();
  }

  void goToHome() {
    _navigateTo.value = '/home';
  }
  
  void pickImage() {
    // TODO: implement pickImage
  }
  
}
