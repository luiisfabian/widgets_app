import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// un simple bool
final isDarkModeProvider = StateProvider((ref) => false);

// un simple int
final selectColorProvider = StateProvider((ref) => 0);
