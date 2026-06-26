import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/coffee-item.dart';

class CoffeeNotifier extends StateNotifier<List<CoffeeItem>> {
  CoffeeNotifier() : super([
    CoffeeItem(
      nome: 'Cappuccino',
      preco: 12.90,
      categoria: CoffeeCategory.quentes,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://cdn0.tudoreceitas.com/pt/posts/7/7/0/cappuccino_funcional_3077_1200.jpg',
    ),
    CoffeeItem(
      nome: 'Espresso',
      preco: 6.90,
      categoria: CoffeeCategory.quentes,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://storage.googleapis.com/takeapp/media/clqowtgyq00020fjra7x66sx1.png',
    ),
    CoffeeItem(
      nome: 'Caffe Latte',
      preco: 13.90,
      categoria: CoffeeCategory.quentes,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://coffeebros.com/cdn/shop/articles/unnamed_be2775a1-186d-40c1-b094-488fa5fa4050.png?v=1675965693',
    ),
    CoffeeItem(
      nome: 'Macchiato',
      preco: 10.90,
      categoria: CoffeeCategory.quentes,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://www.shutterstock.com/image-photo/espresso-macchiato-milk-foam-served-600nw-2680001835.jpg',
    ),
    CoffeeItem(
      nome: 'Frappuccino',
      preco: 16.90,
      categoria: CoffeeCategory.geladas,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://coffeecopycat.com/wp-content/uploads/2024/10/AppleCrispOatmilkFrappe5-1200x1800-1.jpg',
    ),
    CoffeeItem(
      nome: 'Affogato',
      preco: 14.90,
      categoria: CoffeeCategory.geladas,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://cdn.prod.website-files.com/652f1dc57f648485e3aee801/687778583621e8885d59a8fc_Xxn68BIhGoEIgI_QLRzEW_image.webp',
    ),
    CoffeeItem(
      nome: 'Petit Gateau',
      preco: 16.90,
      categoria: CoffeeCategory.doces,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://guiadacozinha.com.br/wp-content/uploads/2007/01/petit-gateau.jpg',
    ),
    CoffeeItem(
      nome: 'Croissant Doce',
      preco: 16.90,
      categoria: CoffeeCategory.doces,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://guiadacozinha.com.br/wp-content/uploads/2012/01/croissant-de-chocolate.jpg',
    ),
    CoffeeItem(
      nome: 'Porção de Pão de Queijo',
      preco: 21.90,
      categoria: CoffeeCategory.salgados,
      dataLancamento: DateTime.now(),
      imagemUrl: 'https://essareceitafunciona.com.br/wp-content/uploads/2022/07/Pao-de-queijo-Essa-Receita-Funciona-9.jpg',
    ),
  ]);

  void toggleFavorite(String id) {
    state = state.map((item) {
      if (item.id == id) {
        item.favorito = !item.favorito;
      }
      return item;
    }).toList();
  }
}

class FilterNotifier extends StateNotifier<String> {
  FilterNotifier() : super('Todos'); 

  void setFilter(String newFilter) {
    state = newFilter;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, String>((ref) {
  return FilterNotifier();
});

final coffeeProvider = StateNotifierProvider<CoffeeNotifier, List<CoffeeItem>>((ref) {
  return CoffeeNotifier();
});