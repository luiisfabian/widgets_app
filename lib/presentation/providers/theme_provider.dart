import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// un simple bool
final isDarkModeProvider = StateProvider((ref) => false);

// un simple int
final selectColorProvider = StateProvider((ref) => 0);

// un objeto de tipo AppTheme (custom)

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifierController, AppTheme>(
        (ref) => ThemeNotifierController());

// controller o notifier
class ThemeNotifierController extends StateNotifier<AppTheme> {
  // STATE = Estado  = new Theme()
  ThemeNotifierController() : super(AppTheme());

  void toggleDartMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
