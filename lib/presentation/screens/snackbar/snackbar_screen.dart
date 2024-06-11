import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbars';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      // ignore: prefer_const_constructors
      content: Text("hola mundo"),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
      ),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          
          title: const Text("estas seguro?"),
          content: Text("Est eiusmod labore est nulla dolor nisi ad."),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Cerrar"),
            ),
            FilledButton(onPressed: () {}, child: Text("Aceptar"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar y dialogs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  Text(
                      "Incididunt velit do deserunt veniam anim adipisicing minim fugiat minim ipsum consequat magna ea anim. Incididunt ipsum enim dolor proident. Fugiat commodo exercitation reprehenderit anim laborum dolor et nulla sint est. Incididunt pariatur irure eiusmod enim. Qui in exercitation eiusmod minim ut esse.Est et pariatur tempor est adipisicing. Ea aliquip id aute aliquip nisi tempor anim. Labore aliquip aute officia ullamco et esse magna id ex fugiat. Cillum elit irure reprehenderit elit mollit elit aute ex aliqua. Sint proident ea laborum qui. Ea et consequat ex culpa proident excepteur aliqua officia laborum eiusmod deserunt. Consectetur reprehenderit dolore id laboris dolor proident dolor ut esse nulla voluptate et. Ut labore reprehenderit consequat id voluptate nostrud deserunt. Duis in Lorem do irure quis dolore do laborum laboris sint. Exercitation ex eiusmod labore ipsum. Culpa ut laboris aliqua minim duis aliquip consequat commodo cupidatat laboris proident in. Sit consectetur duis esse non. Esse adipisicing aute officia non aliquip."),
                ]);
              },
              child: Text("Licencias usadas"),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text("Mostrar dialogos"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text("Mostrar SnackBar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
