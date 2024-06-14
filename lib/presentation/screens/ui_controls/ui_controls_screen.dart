import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'uiControls';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const UiControlsView(),
    );
  }
}

enum Transportation { car, plane, submarine, motorcycle }

class UiControlsView extends StatefulWidget {
  const UiControlsView({
    super.key,
  });

  @override
  State<UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles Adiccionales"),
          value: isDeveloper,
          onChanged: (value) {
            isDeveloper = !isDeveloper;
            setState(() {});
          },
        ),
        ExpansionTile(
          title: const Text("Vehiculo de transporte"),
          subtitle: Text("${selectedTransportation}"),
          children: [
            RadioListTile(
              title: const Text("Por Carro"),
              subtitle: const Text("Ir en carro"),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.car;
                },
              ),
            ),
            RadioListTile(
              title: const Text("Por Moto"),
              subtitle: const Text("Ir en Moto"),
              value: Transportation.motorcycle,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.motorcycle;
                },
              ),
            ),
            RadioListTile(
              title: const Text("Por Avión"),
              subtitle: const Text("Ir en Avión"),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.plane;
                },
              ),
            ),
            RadioListTile(
              title: const Text("Por Submarino"),
              subtitle: const Text("Ir en submarino"),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.submarine;
                },
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text("Desayuno?"),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text("Almuerzo?"),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
            title: const Text("Cena?"),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
