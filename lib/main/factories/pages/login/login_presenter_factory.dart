import 'package:myinventory/ui/pages/login/ilogin_presenter.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

ILoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation());
}