import 'package:asicoffee/card.dart';
import 'package:flutter/material.dart';
import 'package:asicoffee/data/coffee-itens.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  String categoriaSelecionada = 'Todos';

  @override
  Widget build(context) {
    final filteredItems;
    
    if (categoriaSelecionada == 'Todos'){
      filteredItems = coffeeItens;
    }else if(categoriaSelecionada == 'Favoritos'){
      filteredItems = coffeeItens.where((item) => item.favorito == true).toList();
    }else{
      filteredItems = coffeeItens.where((item) => item.categoria == categoriaSelecionada).toList();
    }
        
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 42, 99, 197),
          title: Text(
            'AsiCoffee Menu',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/coffee-beans3.png'),
            ),
          ],
        ),

        body: Column(
          children: [
            Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ChoiceChip(
                      label: Text(
                        categoria,
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: selecionado,
                      selectedColor: Color.fromARGB(255, 42, 99, 197),
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
