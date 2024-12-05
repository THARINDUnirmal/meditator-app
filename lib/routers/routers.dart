import 'package:go_router/go_router.dart';
import 'package:meditator_app/routers/route_names.dart';
import 'package:meditator_app/screens/main_screen.dart';

class Routers {
  final routes = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: RouteNames.mainScreen,
        path: "/",
        builder: (context, state) {
          return const MainScreen();
        },
      )
    ],
  );
}
