import 'package:go_router/go_router.dart';
import 'package:mediease/pages/main_screen.dart';
import 'package:mediease/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.mainPage,
        builder: (context, state) {
          return const MainScreen();
        },
      ),
    ],
  );
}
