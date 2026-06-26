import 'package:asicoffee/providers/products-provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu-screen.dart';
import 'favorite-screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _abaSelecionada = 0;

  final List<Widget> _telas = [
    const MenuScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final filtroAtivo = ref.watch(filterProvider);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF331B1B),
        iconTheme: const IconThemeData(
          color: Color(0xFFEDE5D1)
        ),
        title: Text(
          _abaSelecionada == 0 ? 'CARDÁPIO' : 'MEUS FAVORITOS',
          style: GoogleFonts.inriaSans(
            color: const Color(0xFFEDE5D1),
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
      
      drawer: Drawer(
        backgroundColor: const Color(0xFFEDE5D1), 
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              color: const Color(0xFF331B1B),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Text(
                'Filtros de Busca',
                style: GoogleFonts.inriaSans(
                  color: const Color(0xFFEDE5D1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...['Todos', 'Bebidas Quentes', 'Bebidas Geladas', 'Doces', 'Salgados'].map((categoria) {
              final isSelecionado = filtroAtivo == categoria;
              return ListTile(
                title: Text(
                  categoria,
                  style: GoogleFonts.inriaSans(
                    fontSize: 18,
                    fontWeight: isSelecionado ? FontWeight.bold : FontWeight.normal,
                    color: isSelecionado ? const Color(0xFF55A1E8) : const Color(0xFF331B1B),
                  ),
                ),
                selected: isSelecionado,
                onTap: () {
                  ref.read(filterProvider.notifier).setFilter(categoria);
                  Navigator.pop(context); 
                },
              );
            }).toList(),
          ],
        ),
      ),

      body: _telas[_abaSelecionada],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _abaSelecionada,
        onTap: (index) {
          setState(() {
            _abaSelecionada = index;
          });
        },
        backgroundColor: const Color(0xFF331B1B),
        selectedItemColor: const Color(0xFF55A1E8), 
        unselectedItemColor: const Color(0xFFEDE5D1), 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}