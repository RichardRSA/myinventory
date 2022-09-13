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
  final String image;
  final int update;
  FieldValue get created => FieldValue.serverTimestamp();

  Product(
      {required this.name,
      required this.code,
      required this.update,
      this.price = 0.0,
      this.quantity = 0,
      this.image = 'https://firebasestorage.googleapis.com/v0/b/my-inventory-app-b8e4e.appspot.com/o/images%2Fproducts%2FnoImage.png?alt=media&token=b1dd175c-558f-4e74-b09a-bdfcd085652b'});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        code: json["code"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        update: json["update"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "created": created,
        "image": image,
        "name": name,
        "price": price,
        "quantity": quantity,
        "update": update,
      };
}
