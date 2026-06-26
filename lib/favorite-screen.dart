import 'package:asicoffee/card.dart';
import 'package:asicoffee/providers/products-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final coffeeItens = ref.watch(coffeeProvider);
    
    final favoriteItems = coffeeItens.where((item) => item.favorito).toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 248, 237, 208),
            Color(0xFFEDE5D1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: favoriteItems.isEmpty
          ? Center(
              child: Text(
                'Você ainda não favoritou nenhum café!',
                style: GoogleFonts.inriaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF331B1B),
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return CoffeeCard(item: item);
              },
            ),
    );
  }
}