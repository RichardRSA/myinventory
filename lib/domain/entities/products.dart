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

class Products {
  final String nome;
  final String codigo;
  final double preco;
  final int quantidade;
  final List<Uri> imagens;

  Products({
    required this.nome,
    required this.codigo,
    this.preco = 0.0,
    this.quantidade = 0,
    this.imagens = const []
  });
}
