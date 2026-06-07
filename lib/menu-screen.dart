import 'package:asicoffee/card.dart';
import 'package:flutter/material.dart';
import 'package:asicoffee/data/coffee-itens.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 42, 99, 197),
          title: Text(
            'AsiCoffee Menu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/coffee-beans.png'),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: coffeeItens.length,
          itemBuilder: (context, index) {
            final item = coffeeItens[index];
            return CoffeeCard(item: item);
          },
        ),
      ),
    );
  }
}
