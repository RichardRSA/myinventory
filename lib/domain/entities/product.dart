// ## Product requirements

// 1 - Os dados do produto são:
//  ✅ Nome (campo de preenchimento obrigatório),
//  ✅ preço,
//  ✅ quantidade em estoque e
//  ✅ código (campo de preenchimento obrigatório),
//  ✅ Imagens dos produtos;

// 2 - O botão de salvar só deve ser habilitado após o preenchimento dos campos obrigatórios;

// 3 - Opção de deletar o produto caso seja uma edição;

// 4 - Imagens dos produtos;

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  
  final String name;
  final String code;
  final double price;
  final int quantity;
  final String? image;
  final int update;
  FieldValue get created => FieldValue.serverTimestamp();

  Product({
    required this.name,
    required this.code,
    required this.update,
    this.price = 0.0,
    this.quantity = 0,
    this.image,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'update': update,
    'price': price,
    'quantity': quantity,
    'image': image,
    'created': created
  };

}