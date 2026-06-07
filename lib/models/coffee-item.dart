class CoffeeItem{
  final String nome;
  final double preco;
  final String imagemUrl;
  final String categoria;
  bool favorito;

  CoffeeItem({
    required this.nome, 
    required this.preco, 
    required this.imagemUrl, 
    required this.categoria,
    this.favorito = false
    });
}