import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const  HomeScreen(), name: HomeScreen.name),
    GoRoute(path: '/bottons', builder: (context, state) => const  BottonsScreen(), name: BottonsScreen.name),
    GoRoute(path: '/cards', builder: (context, state) => const  CardsScreen(), name: CardsScreen.name),
    GoRoute(path: '/animated', builder: (context, state) => const  AnimatedScreen(), name: AnimatedScreen.name),
    GoRoute(path: '/tutorial', builder: (context, state) => const  AppTutorialScreen(), name: AppTutorialScreen.name),
    GoRoute(path: '/infiniteScroll', builder: (context, state) =>  InfiteScrollScreen(), name: InfiteScrollScreen.name),
    GoRoute(path: '/progress', builder: (context, state) => const  ProgressScreen(), name: ProgressScreen.name),
    GoRoute(path: '/snackbars', builder: (context, state) => const  SnackBarScreen(), name: SnackBarScreen.name),
    GoRoute(path: '/uiControls', builder: (context, state) => const  UiControlsScreen(), name: UiControlsScreen.name),
  ]
);
