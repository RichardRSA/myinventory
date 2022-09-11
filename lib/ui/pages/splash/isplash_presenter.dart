import 'package:flutter/material.dart';

abstract class ISplashPresenter implements Listenable {
  Stream<String?> get navigateToStream;

  Future<void> checkAccount({int durationInSeconds});
}
