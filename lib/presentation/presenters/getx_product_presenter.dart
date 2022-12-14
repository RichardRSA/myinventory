import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../pages/product/product.dart';
import '../../presentation/dependences/dependences.dart';
import '../../../domain/entities/product.dart';
import '../../../data/http/storage/istorage.dart';

class GetxProductPresenter extends GetxController implements IProductPresenter {
  final IValidation validation;
  final IStorage istorage;
  final ImagePicker _picker = ImagePicker();

  String? _uid;
  String? _name;
  String? _code;
  double? _price;
  int? _quantity;

  var _nameError = RxString('');
  var _codeError = RxString('');
  var _imageError = RxString('');
  var _mainError = RxString('');
  var _navigateTo = RxString('');
  var _pictureImage = RxString('');
  var _priceError = RxDouble(0);
  var _quantityError = RxInt(0);
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get nameErrorStream => _nameError.stream;
  Stream<String> get codeErrorStream => _codeError.stream;
  Stream<String> get imageErrorStream => _imageError.stream;
  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<String> get pictureImageStream => _pictureImage.stream;
  Stream<double> get priceErrorStream => _priceError.stream;
  Stream<int> get quantityErrorStream => _quantityError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxProductPresenter({required this.validation, required this.istorage});

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
      _price = _price == null ? 0 : _price;
      _quantity = _quantity == null ? 0 : _quantity;

      _pictureImage.value = _pictureImage.value.isEmpty
          ? 'https://firebasestorage.googleapis.com/v0/b/my-inventory-app-b8e4e.appspot.com/o/images%2Fproducts%2FnoImage.png?alt=media&token=b1dd175c-558f-4e74-b09a-bdfcd085652b'
          : _pictureImage.value;

      Product _product = Product(
          name: _name!,
          code: _code!,
          update: DateTime.now().millisecondsSinceEpoch,
          price: _price!,
          quantity: _quantity!,
          image: _pictureImage.value);

      if (_uid == null) {
        await istorage.save(document: _product.toJson());
      } else {
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

  void setPrice(double price) {
    _price = price;
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
  }

  void goToHome() {
    _navigateTo.value = '/home';
  }

  void pickImage() async {
    _mainError.value = '';
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      _isLoading.value = true;
      try {
        final storageRef = FirebaseStorage.instance.ref();
        final productRef =
            storageRef.child('product/' + photo.hashCode.toString());
        File file = File(photo.path);
        await productRef.putFile(file);
        _pictureImage.value = await productRef.getDownloadURL();
      } catch (e) {
        _mainError.value = e.toString();
      }
      _isLoading.value = false;
    }
  }

  void deleteImage() async {
    if (_pictureImage.value.isNotEmpty) {
      _mainError.value = '';
      _isLoading.value = true;
      try {
        final storageRef =
            FirebaseStorage.instance.refFromURL(_pictureImage.value);
        await storageRef.delete();
        _pictureImage.value = '';
      } catch (e) {
        _mainError.value = e.toString();
      }
      _isLoading.value = false;
    }
  }
}
