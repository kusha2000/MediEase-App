import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mediease/models/sleep_exercise_model.dart';

class SleepExerciseService {
  //create the box
  var sleepExerciseBox = Hive.box('sleep_contents');

  //Method to add a new sleep exercise
  Future<void> addSleepExercise(
      SleepExercise sleepContent, BuildContext context) async {
    try {
      // Get all the sleep exercises, if any
      final allSleepExercises = sleepExerciseBox.get("sleep_contents") ?? [];

      //add the new sleep exercise
      allSleepExercises.add(sleepContent);

      // Save the new list of sleep exercises
      await sleepExerciseBox.put("sleep_contents", allSleepExercises);

      // Show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sleep exercise added"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print("Service error: $e");
    }
  }

  //Method to get all the sleep exercises
  List<SleepExercise> getSleepExercises() {
    try {
      // Get all the sleep exercises from the Hive box
      final dynamic allSleepExercises = sleepExerciseBox.get("sleep_contents");

      if (allSleepExercises != null && allSleepExercises is List<dynamic>) {
        return allSleepExercises.cast<SleepExercise>().toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Service error: $e");
      return [];
    }
  }

  //Method to delete a sleep exercise
  Future<void> deleteSleepExercise(
      SleepExercise sleepContent, BuildContext context) async {
    try {
      // Get all the sleep exercises, if any
      final allSleepExercises = sleepExerciseBox.get("sleep_contents");

      // Remove the sleep exercise
      allSleepExercises.remove(sleepContent);

      // Save the new list of sleep exercises
      await sleepExerciseBox.put("sleep_contents", allSleepExercises);

      //show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sleep exercise deleted"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print("Service error: $e");
    }
  }
}
