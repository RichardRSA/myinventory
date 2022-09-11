import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../firebase_options.dart';
import '../../ui/components/components.dart';
import 'factories/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Provider.debugCheckInvalidValueType = null;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: 'myInventory',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage),
        GetPage(name: '/login', page: makeLoginPage),
        GetPage(name: '/signup', page: makeSignUpPage),
        GetPage(name: '/products', page: () => Scaffold(body: Text('Produtos')))
      ],
    );
  }
}