import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: "Botones", subTitle: "varios botones flutter", link: "/bottons", icon: Icons.smart_button_outlined),
  MenuItem(title: "Tarjetas", subTitle: "contenedor estilizado", link: "/cards", icon: Icons.credit_card),
  MenuItem(title: "Progress Indicator", subTitle: "Genenerales y controlads", link: "/progress", icon: Icons.refresh_rounded),
  MenuItem(title: "SnackBars y dialogs", subTitle: "Indicadores en pantalla", link: "/snackbars", icon: Icons.info_outline),
  MenuItem(title: "Animated container", subTitle: "Animación de contenedor", link: "/animated", icon: Icons.check_box_outlined),
  MenuItem(title: "Checkbox, Radios y otros tiles", subTitle: "Ui Controls", link: "/uiControls", icon: Icons.keyboard_control_sharp),
  MenuItem(title: "Page View Introduccion", subTitle: "Pequeño ttutorial", link: "/tutorial", icon: Icons.pages_outlined),
  
];
