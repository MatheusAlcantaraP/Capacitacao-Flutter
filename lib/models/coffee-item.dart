import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum CoffeeCategory {quentes, geladas, doces, salgados}

class CoffeeItem {
  CoffeeItem({
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.dataLancamento,
    required this.imagemUrl,
    this.favorito = false,
  }) : id = uuid.v4();

  final String id;
  final String nome;
  final double preco;
  final CoffeeCategory categoria;
  final DateTime dataLancamento;
  final String imagemUrl;
  bool favorito;

  String get categoriaTexto {
    switch (categoria) {
      case CoffeeCategory.quentes: 
        return 'Bebidas Quentes';
      case CoffeeCategory.geladas: 
        return 'Bebidas Geladas';
      case CoffeeCategory.doces: 
        return 'Doces';
      case CoffeeCategory.salgados: 
        return 'Salgados';
    }
  }
}