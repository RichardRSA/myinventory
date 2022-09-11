abstract class ISignUpPresenter {
  Stream<String> get emailErrorStream;
  Stream<String> get passwordErrorStream;
  Stream<String> get confirmPasswordErrorStream;
  Stream<String> get mainErrorStream;
  Stream<String> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  void validateEmail(String email);
  void validatePassword(String password);
  void validateConfirmPassword(String confirmPassword);
  Future<void> signUp();
  void dispose();
}