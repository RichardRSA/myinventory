abstract class IProductPresenter {
  Stream<String> get nameErrorStream;
  Stream<String> get codeErrorStream;
  Stream<double> get priceErrorStream;
  Stream<int> get quantityErrorStream;
  Stream<String> get imageErrorStream;
  Stream<String> get mainErrorStream;
  Stream<String> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  void validateName(String name);
  void validateCode(String code);
  void save();
  void goToHome();
  void pickImage();
  void dispose();
}