import 'package:asicoffee/providers/products-provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu-screen.dart';
import 'favorite-screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:asicoffee/models/coffee-item.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _abaSelecionada = 0;

  final List<Widget> _telas = [const MenuScreen(), const FavoritesScreen()];

  CoffeeCategory _categoriaSelecionada = CoffeeCategory.quentes;
  DateTime _dataSelecionada = DateTime.now();

  void _abrirFormularioCadastro() {
    final formKey = GlobalKey<FormState>();
    String nome = '';
    double preco = 0.0;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFEDE5D1),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Novo Item no Cardápio',
                  style: GoogleFonts.inriaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF331B1B),
                  ),
                ),
                const SizedBox(height: 15),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome do Café'),
                  validator: (v) => v == null || v.trim().isEmpty
                      ? 'Insira um nome válido'
                      : null,
                  onSaved: (v) => nome = v!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Preço (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v == null ||
                          double.tryParse(v) == null ||
                          double.parse(v) < 0
                      ? 'Insira um preço válido'
                      : null,
                  onSaved: (v) => preco = double.parse(v!),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<CoffeeCategory>(
                  value: _categoriaSelecionada,
                  decoration: const InputDecoration(labelText: 'Categoria'),
                  items: CoffeeCategory.values
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(
                            {
                              CoffeeCategory.quentes: 'Bebidas Quentes',
                              CoffeeCategory.geladas: 'Bebidas Geladas',
                              CoffeeCategory.doces: 'Doces',
                              CoffeeCategory.salgados: 'Salgados',
                            }[cat]!,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _categoriaSelecionada = v!),
                ),
                const SizedBox(height: 15),

                StatefulBuilder(
                  builder: (context, setModalState) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Data de Lançamento: ${_dataSelecionada.day}/${_dataSelecionada.month}/${_dataSelecionada.year}',
                            style: GoogleFonts.inriaSans(),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null)
                              setModalState(() => _dataSelecionada = picked);
                          },
                          child: const Text('Selecionar Data'),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF331B1B),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      ref.read(coffeeProvider.notifier).addItem(
                            CoffeeItem(
                              nome: nome,
                              preco: preco,
                              categoria: _categoriaSelecionada,
                              dataLancamento: _dataSelecionada,
                              imagemUrl:
                                  'https://img.magnific.com/fotos-premium/bebida-de-cafe-em-mesa-de-madeira-com-cafeteria-desfocada-como-fundo_1205263-46302.jpg?semt=ais_hybrid&w=740&q=80',
                            ),
                          );
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Cadastrar Café',
                    style: GoogleFonts.inriaSans(
                      color: const Color(0xFFEDE5D1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtroAtivo = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF331B1B),
        iconTheme: const IconThemeData(color: Color(0xFFEDE5D1)),
        title: Text(
          _abaSelecionada == 0 ? 'CARDÁPIO' : 'MEUS FAVORITOS',
          style: GoogleFonts.inriaSans(
            color: const Color(0xFFEDE5D1),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFFEDE5D1), size: 28),
            onPressed: _abrirFormularioCadastro,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset('assets/images/asicoffee.png'),
          ),
          const SizedBox(width: 8),
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
            ...[
              'Todos',
              'Bebidas Quentes',
              'Bebidas Geladas',
              'Doces',
              'Salgados',
            ].map((categoria) {
              final isSelecionado = filtroAtivo == categoria;
              return ListTile(
                title: Text(
                  categoria,
                  style: GoogleFonts.inriaSans(
                    fontSize: 18,
                    fontWeight: isSelecionado
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelecionado
                        ? const Color(0xFF55A1E8)
                        : const Color(0xFF331B1B),
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
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Cardápio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
