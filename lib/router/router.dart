import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/pages/main_screen.dart';
import 'package:mediease/pages/mindFull_exercise_details_page.dart';
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
      GoRoute(
        path: "/mindFullExercise",
        name: RouteNames.mindFullExercise,
        builder: (context, state) {
          final mindFullExerciseJson =
              state.uri.queryParameters['mindFullnessExercises'];
          final mindFullnessExercise =
              MindFullnessExercise.fromJson(jsonDecode(mindFullExerciseJson!));
          return MindFullExerciseDetailsPage(
            mindFullnessExercise: mindFullnessExercise,
          );
        },
      ),
    ],
  );
}
