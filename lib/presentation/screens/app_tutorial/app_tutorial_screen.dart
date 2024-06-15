import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: "Busca la comida",
      caption: "Consequat minim occaecat dolore Lorem elit ipsum aliqua irure.",
      imageUrl: "assets/images/1.png"),
  SlideInfo(
      title: "Entrega lo mejor",
      caption: "Culpa tempor fugiat eiusmod do aute in esse quis aute.",
      imageUrl: "assets/images/2.png"),
  SlideInfo(
      title: "Buen provecho",
      caption: "Sunt mollit aliqua eu eu laboris proident ut voluptate.",
      imageUrl: "assets/images/3.png")
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Salir"),
            ),
          ),
          endReach
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("Empezar"),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});
  final String title;
  final String caption;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.titleMedium;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
