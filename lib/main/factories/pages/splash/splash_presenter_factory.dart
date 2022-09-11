import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/splash/splash.dart';
import '../../factories.dart';

ISplashPresenter makeGetxSplashPresenter() =>
  GetxSplashPresenter(loadCurrentAccount: makeLocalLoadCurrentAccount());