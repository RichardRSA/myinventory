import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../lib/firebase_options.dart';
import '../lib/ui/components/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}
