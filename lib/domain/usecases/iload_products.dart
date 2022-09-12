import '../entities/entities.dart';

abstract class LoadProducts {
  Future<List<Product>> load();
}