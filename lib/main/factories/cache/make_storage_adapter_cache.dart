import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:myinventory/datalayer/usecases/usecases.dart';

LocalStorageAdapter makeLocalStorageAdapter() {
  final flutterSecureStorage = FlutterSecureStorage();
  return LocalStorageAdapter(flutterSecureStorage: flutterSecureStorage);
}
