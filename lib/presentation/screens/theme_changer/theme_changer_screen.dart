import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChargerScreen extends ConsumerWidget {
  const ThemeChargerScreen({super.key});
  static const name = "themeChangerScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool dartMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme charger"),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier).update((darkMode) => !darkMode);
              ref.read(themeNotifierProvider.notifier).toggleDartMode();
            },

            // icon: Icon(Icons.light_mode_outlined),
            icon: dartMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            "Este Color ",
            style: TextStyle(color: color),
          ),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            //todo notificar el cambio
            // ref.read(selectColorProvider.notifier).state = index;

            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
      itemCount: colors.length,
    );
  }
}
