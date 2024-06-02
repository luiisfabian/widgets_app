import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const  HomeScreen(), name: HomeScreen.name),
    GoRoute(path: '/bottons', builder: (context, state) => const  BottonsScreen(), name: BottonsScreen.name),
    GoRoute(path: '/cards', builder: (context, state) => const  CardsScreen(), name: CardsScreen.name),
  ]
);
