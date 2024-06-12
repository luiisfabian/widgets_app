import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = 50;
    double _height = 50;
    Color _color = Colors.indigo;
    double _borderRadious = 10.0;

    void changeShape() {
      final random = new Random();

      setState(() {
        _width = random.nextInt(300) + 120;
        _height = random.nextInt(250) + 120;
        _borderRadious = random.nextInt(100) + 20;
        _color = Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
          child: AnimatedContainer(
        curve: Curves.elasticInOut,
        duration: Duration(milliseconds: 4000),
        child: Container(
          width: _width <= 0 ? 0 : _width,
          height: _height <= 0 ? 0 : _height,
          decoration: BoxDecoration(
              color: _color,
              borderRadius:
                  BorderRadius.circular(_borderRadious < 0 ? 0 : _borderRadious)),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed:  changeShape,
        child: Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}
