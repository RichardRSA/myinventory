import 'package:myinventory/ui/pages/login/ilogin_presenter.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

ILoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation(),
      saveAccount: makeLocalSaveCurrentAccount());
}