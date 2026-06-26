import 'package:asicoffee/tabs-screen.dart';
import 'package:flutter/material.dart';
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

            Image.asset('assets/images/asicoffee.png', width: 204),

            SizedBox(height: 18),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Asi',
                    style: GoogleFonts.inriaSans(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF55A1E8),
                    ),
                  ),
                  TextSpan(
                    text: 'Coffee',
                    style: GoogleFonts.inriaSans(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF331B1B),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 4),

            Text(
              'Conecta você aos melhores sabores do café!',
              textAlign: TextAlign.center,
              style: GoogleFonts.inriaSans(fontSize: 18, color: Color(0xFF331B1B)),
            ),

            Spacer(),

            SizedBox(
              width:  260,
              height: 70,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TabsScreen()),
                  );
                },
                icon: Icon(Icons.coffee),
                label: Text(
                  'Explorar Cardápio',
                  style: GoogleFonts.inriaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF331B1B),
                  foregroundColor:  Color(0xFFEDE5D1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),

            SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
