import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'}
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards';

  const CardsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) =>
                CardTypeOne(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) =>
                CardTypeTwo(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) => CardTypeThree(
                label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) => CardTypeFour(
                label: card['label'], elevation: card['elevation']),
          ),
          
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class CardTypeOne extends StatelessWidget {
  const CardTypeOne({super.key, required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ),
              Align(alignment: Alignment.bottomLeft, child: Text(label)),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTypeTwo extends StatelessWidget {
  const CardTypeTwo({super.key, required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: colors.outline),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text('${label} Outline')),
          ],
        ),
      ),
    );
  }
}

class CardTypeThree extends StatelessWidget {
  const CardTypeThree(
      {super.key, required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
        final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surface,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(label + "- Filled")),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTypeFour extends StatelessWidget {
  const CardTypeFour(
      {super.key, required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
        final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network('https://picsum.photos/id/${elevation.toInt()}/600/300', height: 350, fit: BoxFit.cover,),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
