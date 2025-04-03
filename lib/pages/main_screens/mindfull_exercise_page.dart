import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/providers/mindfull_exercise_provider.dart';
import 'package:mediease/router/route_names.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MindFullExercisePage extends StatelessWidget {
  const MindFullExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> iconMap = {
      'air': Icons.air,
      'book': Icons.book,
      'self_improvement': Icons.self_improvement,
      'center_focus_strong': Icons.center_focus_strong,
      'grass': Icons.grass,
      'directions_walk': Icons.directions_walk,
      'favorite': Icons.favorite,
      'fitness_center': Icons.fitness_center,
      'wb_sunny': Icons.wb_sunny,
      'brush': Icons.brush,
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MindFull Exercise",
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryBlue,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryBlue,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onChanged: (value) {
                  Provider.of<MindfullExerciseProvider>(context, listen: false)
                      .searchMindFullExercise(value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<MindfullExerciseProvider>(
                builder: (context, mindFullExercises, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: mindFullExercises.mindFullExercise.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      MindFullnessExercise mindFullnessExercise =
                          mindFullExercises.mindFullExercise[index];
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                              RouteNames.mindFullExercise,
                              queryParameters: {
                                "mindFullnessExercises":
                                    jsonEncode(mindFullnessExercise.toJson()),
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDarkBlue.withOpacity(0.1),
                          ),
                          child: ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.primaryWhite,
                              ),
                              child: Icon(
                                iconMap[mindFullnessExercise.imagePath] ??
                                    Icons.help_outline,
                                color: AppColors.primaryBlue,
                                size: 40,
                              ),
                            ),
                            title: Text(mindFullnessExercise.name,
                                style: AppTextStyles.subtitleStyle),
                            subtitle: Text(
                              mindFullnessExercise.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyStyle.copyWith(
                                  color: AppColors.primaryDarkBlue
                                      .withOpacity(0.7)),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
