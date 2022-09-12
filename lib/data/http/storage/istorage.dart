import '../../../domain/entities/entities.dart';

abstract class IStorage {
  Future<Product> getByUid({required String uid});

  Future<List<Product>> getList({required String uid});

  Future<Product> save({required Product product});

  Future<Product> update({
    required String uid,
    required Product product,
  });

  Future<void> delete({required String uid});
}
