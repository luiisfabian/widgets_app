import 'package:flutter/material.dart';

class BottonsScreen extends StatelessWidget {
    static const String name = 'bottons';

  const BottonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottons Screen"),
      ),
      body: const Placeholder(),
    );
  }
}
