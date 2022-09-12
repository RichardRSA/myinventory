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

class Product {
  final String name;
  final String code;
  final double price;
  final int quantity;
  final List<Uri> images;

  Product({
    required this.name,
    required this.code,
    this.price = 0.0,
    this.quantity = 0,
    this.images = const []
  });
}
