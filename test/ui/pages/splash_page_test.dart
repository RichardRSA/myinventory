// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'package:myinventory/ui/pages/splash/splash.dart';

// class SplashPresenterSpy extends Mock implements ISplashPresenter {}

// void main() {
//   late SplashPresenterSpy presenter;
//   late StreamController<String> navigateToController;

//   Future<void> loadPage(WidgetTester tester) async {
//     presenter = SplashPresenterSpy();
//     navigateToController = StreamController<String>();

//     when(presenter.navigateToStream)
//         .thenAnswer((_) => navigateToController.stream);

//     await tester.pumpWidget(GetMaterialApp(
//       initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => SplashPage(presenter: presenter)),
//         GetPage(
//             name: '/any_route', page: () => Scaffold(body: Text('fake page'))),
//       ],
//     ));
//   }

//   tearDown(() {
//     navigateToController.close();
//   });

//   // testWidgets('Should present spinner on page load',
//   //     (WidgetTester tester) async {
//   //   await loadPage(tester);
//   //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
//   // });

//   // testWidgets('Should call token on page load', (WidgetTester tester) async {
//   //   await loadPage(tester);
//   //   verify(presenter.checkAccount()).called(1);
//   // });

//   // testWidgets('Should load page', (WidgetTester tester) async {
//   //   await loadPage(tester);

//   //   navigateToController.add('/any_route');
//   //   await tester.pumpAndSettle();

//   //   expect(Get.currentRoute, '/any_route');
//   //   expect(find.text('fake page'), findsOneWidget);
//   // });
// }
