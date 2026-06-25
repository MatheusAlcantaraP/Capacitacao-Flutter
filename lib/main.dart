import 'package:flutter/material.dart';
import 'package:asicoffee/start-screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: MainContainer(),
        ),
      ),  
    )
  );
}

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF2CF),
            Color(0xFFEDE5D1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const StartScreen(),
    );
  }
}