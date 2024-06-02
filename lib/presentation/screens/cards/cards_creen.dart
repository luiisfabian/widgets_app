import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
    static const String name = 'cards';

  const CardsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const Placeholder(),
    );
  }
}
