import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.orange,
  Colors.brown,
  Colors.black,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;

  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'El Color debe ser mayor a 0'),
        assert(selectedColor < colorList.length,
            'El Color debe ser menor a ${colorList.length - 1}');

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectedColor], brightness: isDarkMode ? Brightness.dark : Brightness.light);
}
