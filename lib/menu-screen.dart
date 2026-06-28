import 'package:asicoffee/card.dart';
import 'package:asicoffee/providers/products-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coffeeItens = ref.watch(coffeeProvider);
    final categoriaSelecionada = ref.watch(filterProvider);

    final List<dynamic> filteredItems;

    if (categoriaSelecionada == 'Todos') {
      filteredItems = coffeeItens;
    } else {
      filteredItems = coffeeItens
          .where((item) => item.categoriaTexto == categoriaSelecionada)
          .toList();
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 248, 237, 208), Color(0xFFEDE5D1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                (categoriaSelecionada),
                style: GoogleFonts.inriaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF331B1B),
                ),
              ),
            ),

            Expanded(
              child: filteredItems.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhum item encontrado nessa categoria!',
                        style: GoogleFonts.inriaSans(),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return Dismissible(
                          key: ValueKey(item.id), 
                          direction: DismissDirection
                              .endToStart, 
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            ref
                                .read(coffeeProvider.notifier)
                                .removeItem(item.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${item.nome} removido do cardápio',
                                ),
                              ),
                            );
                          },
                          child: CoffeeCard(
                            item: item,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
