import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mediease/router/route_names.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/widgets/tabs/meditation_tab.dart';
import 'package:mediease/widgets/tabs/mindfull_exercise.dart';
import 'package:mediease/widgets/tabs/sleep_exercise_tab.dart';

class CustomExercisePage extends StatelessWidget {
  const CustomExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Exercises",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue)),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Meditations"),
              Tab(text: "Sleep Exercises"),
              Tab(text: "Mindful Exercises"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(RouteNames.create);
          },
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
          children: [
            MeditationsTab(),
            SleepExercisesTab(),
            MindfulExercisesTab(),
          ],
        ),
      ),
    );
  }
}
