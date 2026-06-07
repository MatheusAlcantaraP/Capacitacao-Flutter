import 'package:flutter/material.dart';
import 'package:asicoffee/menu-screen.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),

            Image.asset('assets/images/coffee-beans3.png', width: 130),

            SizedBox(height: 18),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Asi',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 15, 13, 107),
                    ),
                  ),
                  TextSpan(
                    text: 'Coffee',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 248, 244, 244),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),

            Text(
              'O AsiCoffee é um aplicativo desenvolvido para conectar você aos melhores sabores do café, oferecendo uma experiência moderna, prática e acolhedora.',
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(fontSize: 18, color: Colors.white),
            ),

            SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuScreen()),
                  );
                },
                icon: Icon(Icons.coffee),
                label: Text(
                  ' Explorar Cardápio',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 15, 13, 107),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            Spacer(),

            Image.asset('assets/images/asimov.png', width: 80),
          ],
        ),
      ),
    );
  }
}
