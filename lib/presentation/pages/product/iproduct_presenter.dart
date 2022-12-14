abstract class IProductPresenter {

  Stream<String> get nameErrorStream;
  Stream<String> get codeErrorStream;
  Stream<double> get priceErrorStream;
  Stream<int> get quantityErrorStream;
  Stream<String> get imageErrorStream;
  Stream<String> get mainErrorStream;
  Stream<String> get navigateToStream;
  Stream<String> get pictureImageStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  void validateName(String name);
  void validateCode(String code);
  void setPrice(double price);
  void setQuantity(int quantity);
  void save();
  void goToHome();
  void pickImage();
  void deleteImage();
  void dispose();
}