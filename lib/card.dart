import 'package:asicoffee/models/coffee-item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      color: const Color.fromARGB(255, 239, 240, 248),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                widget.item.imagemUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.nome,
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.item.categoria,
                    style: GoogleFonts.outfit(fontSize: 14),
                  ),
                  Text(
                    'R\$ ${widget.item.preco.toStringAsFixed(2)}',
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
