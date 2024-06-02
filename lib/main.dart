import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/buttons/bottons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_creen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      initialRoute:'/',
      routes: {
        '/':(context) =>  HomeScreen(),
        '/cards':(context) => const CardsScreen(),
        '/bottons':(context) => const BottonsScreen()
      },
    );
  }
}
