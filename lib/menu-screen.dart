import 'package:asicoffee/card.dart';
import 'package:asicoffee/providers/products-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends ConsumerStatefulWidget { 
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() { 
    return _MenuScreenState();
  }
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  String categoriaSelecionada = 'Todos';

  @override
  Widget build(BuildContext context) {
    
    final coffeeItens = ref.watch(coffeeProvider); 
    final List<dynamic> filteredItems;
    
    if (categoriaSelecionada == 'Todos'){
      filteredItems = coffeeItens;
    } else if(categoriaSelecionada == 'Favoritos'){
      filteredItems = coffeeItens.where((item) => item.favorito == true).toList();
    } else {
      
      filteredItems = coffeeItens.where((item) => item.categoriaTexto == categoriaSelecionada).toList();
    }
        
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF331B1B),
        iconTheme: const IconThemeData(
          color: Color(0xFFEDE5D1), 
        ),
        title: Text(
          'CARDÁPIO',
          style: GoogleFonts.inriaSans(
            color: Color(0xFFEDE5D1),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/asicoffee.png'),
          ),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 248, 237, 208),
              Color(0xFFEDE5D1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:[
                  'Todos',
                  'Bebidas Quentes',
                  'Bebidas Geladas',
                  'Doces',
                  'Salgados',
                  'Favoritos'
                ].map((categoria) {
                  final selecionado = categoriaSelecionada == categoria;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ChoiceChip(
                      label: Text(
                        categoria,
                        style: GoogleFonts.inriaSans(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Color.fromARGB(255, 248, 242, 225),
                      selected: selecionado,
                      selectedColor: const Color(0xFF55A1E8),
                      onSelected: (bool selected) {
                        setState(() {
                          categoriaSelecionada = categoria;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
        
            Expanded(
              child: filteredItems.isEmpty
                ? Center(child: Text('Nenhum item encontrado nessa categoria.', style: GoogleFonts.spaceGrotesk()))
                : ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return CoffeeCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}