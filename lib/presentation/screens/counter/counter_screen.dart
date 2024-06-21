import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool darkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("CounterScreenScreen"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((darkMode) => !darkMode);
            },

            // icon: Icon(Icons.light_mode_outlined),
            icon: darkMode ? Icon(Icons.light_mode_outlined):Icon(Icons.dark_mode_outlined), 
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            "Valor ${clickCounter}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).update((state) => state + 1);

          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
