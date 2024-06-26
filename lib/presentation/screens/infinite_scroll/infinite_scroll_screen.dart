import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiteScrollScreen extends StatefulWidget {
  static const String name = 'infiniteScroll';

  const InfiteScrollScreen({super.key});

  @override
  State<InfiteScrollScreen> createState() => _InfiteScrollScreenState();
}

class _InfiteScrollScreenState extends State<InfiteScrollScreen> {
  final ScrollController scrollController = new ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent)) {
        //load next Page
        loadNextPage();
      }
      ;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  List<int> imagesIds = [1, 2, 3, 4, 5];

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    //todo revisar si esta montado el componente / widget
    if (isMounted) return;
    setState(() {});

    //todo mover Scroll

    moveScrollBotton();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));

    setState(() {});
  }

  Future onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));

    if (!isMounted) return;

    final lastId = imagesIds.last;
    isLoading = false;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollBotton() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Infite Scrooll"),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          strokeWidth: 2,
          edgeOffset: 10,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    "https://picsum.photos/id/${imagesIds[index]}/500/300"),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child: const Icon(Icons.arrow_back_outlined),
        child: !isLoading == true
            ? SpinPerfect(
                infinite: true,
                child: FadeIn(
                  child: const Icon(Icons.refresh_outlined),
                ),
              )
            : const Icon(Icons.arrow_back_outlined),
        onPressed: () => context.pop(),
      ),
    );
  }
}
