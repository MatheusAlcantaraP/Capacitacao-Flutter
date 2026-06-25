import 'package:asicoffee/models/coffee-item.dart';
import 'package:asicoffee/providers/products-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeCard extends ConsumerWidget {
  final CoffeeItem item;

  const CoffeeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData icone;
    Color cor;

    if (item.favorito) {
      icone = Icons.favorite;
      cor = Colors.red;
    } else {
      icone = Icons.favorite_border;
      cor = Colors.grey;
    }

    return Card(
      color: const Color.fromARGB(255, 252, 246, 230),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  item.imagemUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.nome,
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    item.categoriaTexto,
                    style: GoogleFonts.outfit(fontSize: 14),
                  ),
                  Text(
                    'R\$ ${item.preco.toStringAsFixed(2)}',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 18, 99, 65),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(icone, color: cor),
              onPressed: () {
                ref.read(coffeeProvider.notifier).toggleFavorite(item.id); 
              },
            ),
          ],
        ),
      ),
    );
  }
}