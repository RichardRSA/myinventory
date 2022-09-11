
import '../../../../presentation/pages/signup/signup.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

ISignUpPresenter makeGetxSignUpPresenter() {
  return GetxSignUpPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeSignUpValidation(),
      saveAccount: makeLocalSaveCurrentAccount());
}