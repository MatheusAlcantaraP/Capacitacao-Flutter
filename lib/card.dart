import 'package:asicoffee/models/coffee-item.dart';
import 'package:flutter/material.dart';
import 'package:asicoffee/models/coffee-item.dart';
import 'package:flutter/rendering.dart';

class CoffeeCard extends StatefulWidget {
  final CoffeeItem item;

  const CoffeeCard({super.key, required this.item});

  @override
  State<CoffeeCard> createState() {
    return _CoffeeCardState();
  }
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(context) {
    IconData icone;
    Color cor;

    if (widget.item.favorito) {
      icone = Icons.favorite;
      cor = Colors.red;
    } else {
      icone = Icons.favorite_border;
      cor = Colors.grey;
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(widget.item.imagemUrl, width: 80, height: 80),
            Expanded(
              child: Column(
                children: [
                  Text(widget.item.nome),
                  Text(widget.item.categoria),
                  Text('R\$ ${widget.item.preco.toStringAsFixed(2)}'),
                ],
              ),
            ),
            IconButton(
              icon: Icon(icone, color: cor),
              onPressed: () {
                setState(() {
                  widget.item.favorito = !widget.item.favorito;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
