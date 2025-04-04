import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mediease/models/functions_data_model.dart';
import 'package:mediease/models/meditation_exercise_model.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/models/sleep_exercise_model.dart';
import 'package:mediease/providers/filter_provider.dart';
import 'package:mediease/router/route_names.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //handle minFullness exercises pressed
  void handleMindFulnessExercisePressed(
      BuildContext context, MindFullnessExercise data) {
    GoRouter.of(context)
        .pushNamed(RouteNames.mindFullExercise, queryParameters: {
      "mindFullnessExercises": jsonEncode(data.toJson()),
    });
  }

  //handle meditation exercises pressed
  void handleMeditationExercisePressed(
    BuildContext context,
    final name,
    final description,
    final duration,
    final category,
    final videoUrl,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGrey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGrey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$duration min",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.primaryGreen,
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          shadowColor: WidgetStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          GoRouter.of(context).push(
                            '/functions',
                            extra: FunctionsData(
                              category,
                              title: name,
                              duration: duration,
                              description: description,
                              url: videoUrl,
                            ),
                          );

                          //close the bottom sheet
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Start",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.primaryGrey,
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          shadowColor: WidgetStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  //handle sleep  exercises pressed
  void handleSleepExercisePressed(BuildContext context, SleepExercise data) {
    GoRouter.of(context)
        .pushNamed(RouteNames.sleepExerciseTimer, queryParameters: {
      "sleepExercises": jsonEncode(data.toJson()),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: Provider.of<FilterProvider>(context, listen: false)
            .getData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error Loading Data.."),
            );
          }

          return Consumer<FilterProvider>(
            builder: (context, filterData, child) {
              final completedData = filterData.filterData;
              completedData.shuffle();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "MediEase",
                            style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBlue),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Select a Category to start exploring",
                      style: AppTextStyles.subtitleStyle
                          .copyWith(color: AppColors.primaryDarkBlue),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FilterChip(
                              label: Text(
                                "All",
                                style: TextStyle(
                                    color: filterData.getSelectedCategory() ==
                                            "All"
                                        ? AppColors.primaryWhite
                                        : AppColors.primaryBlack),
                              ),
                              onSelected: (value) {
                                filterData.filteredData("All");
                              },
                              selected:
                                  filterData.getSelectedCategory() == "All",
                              selectedColor: AppColors.primaryBlue,
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side:
                                      BorderSide(color: AppColors.primaryBlue)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            FilterChip(
                              label: Text(
                                "Mindfulness",
                                style: TextStyle(
                                    color: filterData.getSelectedCategory() ==
                                            "MindFullness"
                                        ? AppColors.primaryWhite
                                        : AppColors.primaryBlack),
                              ),
                              onSelected: (value) {
                                filterData.filteredData("MindFullness");
                              },
                              selected: filterData.getSelectedCategory() ==
                                  "MindFullness",
                              selectedColor: AppColors.primaryBlue,
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side:
                                      BorderSide(color: AppColors.primaryBlue)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            FilterChip(
                              label: Text(
                                "Meditation",
                                style: TextStyle(
                                    color: filterData.getSelectedCategory() ==
                                            "Meditation"
                                        ? AppColors.primaryWhite
                                        : AppColors.primaryBlack),
                              ),
                              onSelected: (value) {
                                filterData.filteredData("Meditation");
                              },
                              selected: filterData.getSelectedCategory() ==
                                  "Meditation",
                              selectedColor: AppColors.primaryBlue,
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side:
                                      BorderSide(color: AppColors.primaryBlue)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            FilterChip(
                              label: Text(
                                "Sleep",
                                style: TextStyle(
                                    color: filterData.getSelectedCategory() ==
                                            "Sleep Stories"
                                        ? AppColors.primaryWhite
                                        : AppColors.primaryBlack),
                              ),
                              onSelected: (value) {
                                filterData.filteredData("Sleep Stories");
                              },
                              selected: filterData.getSelectedCategory() ==
                                  "Sleep Stories",
                              selectedColor: AppColors.primaryBlue,
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side:
                                      BorderSide(color: AppColors.primaryBlue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: completedData.isEmpty
                            ? const Center(child: Text("No data available"))
                            : ListView.builder(
                                itemCount: completedData.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        if (completedData[index]
                                            is MindFullnessExercise) {
                                          handleMindFulnessExercisePressed(
                                              context, completedData[index]);
                                        } else if (completedData[index]
                                            is MeditationExercise) {
                                          handleMeditationExercisePressed(
                                              context,
                                              completedData[index].name,
                                              completedData[index].description,
                                              completedData[index].duration,
                                              completedData[index].category,
                                              completedData[index].videoUrl);
                                        } else {
                                          handleSleepExercisePressed(
                                              context, completedData[index]);
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: completedData[index]
                                                  is MindFullnessExercise
                                              ? AppColors.lightGreen
                                              : completedData[index]
                                                      is SleepExercise
                                                  ? AppColors.lightPeach
                                                  : AppColors.lightPurple,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      completedData[index].name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black87,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Text(
                                                      "${completedData[index].duration} min",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  completedData[index].category,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                completedData[index]
                                                    .description,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black54,
                                                  height: 1.4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      )),
    );
  }
}
