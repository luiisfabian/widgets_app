import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class BottonsScreen extends StatelessWidget {
  static const String name = 'bottons';

  const BottonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottons Screen"),
      ),
      body: const _BottonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _BottonsView extends StatelessWidget {
  const _BottonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elavation Botton"),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text("Elavation Botton disabled"),
            ),
            ElevatedButton.icon(
              label: const Text("Elevated Botton Icon"),
              icon: const Icon(Icons.access_alarm_outlined),
              onPressed: () {},
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Filled Button"),
            ),
            FilledButton.icon(
              label: const Text("Filled Icon Button"),
              onPressed: () {},
              icon: const Icon(Icons.dns_sharp),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("outLineBotton"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.door_sliding),
              label: const Text("outLineBotton Icon"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Text Botton"),
            ),
            TextButton.icon(
              label: const Text("text Icon Button"),
              onPressed: () {},
              icon: const Icon(Icons.dns_sharp),
            ),
            //todo custom botton
            const CustomButton(),
            IconButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary)),
              onPressed: () {},
              icon: const Icon(Icons.abc_rounded),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Hola",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
