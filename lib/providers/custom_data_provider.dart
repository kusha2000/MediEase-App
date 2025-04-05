import 'package:flutter/material.dart';
import 'package:mediease/models/meditation_exercise_model.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/models/sleep_exercise_model.dart';
import 'package:mediease/services/meditation_service.dart';
import 'package:mediease/services/mindfull_exercise_service.dart';
import 'package:mediease/services/sleep_exercise_service.dart';


class CustomDataProvider extends ChangeNotifier {
  final List<MeditationExercise> _meditations = [];
  final List<SleepExercise> _sleepExercises = [];
  final List<MindFullnessExercise> _mindfulExercises = [];

  List<MeditationExercise> get meditations => _meditations;
  List<SleepExercise> get sleepExercises => _sleepExercises;
  List<MindFullnessExercise> get mindfulExercises => _mindfulExercises;

  get userCreatedMeditations => null;

  get userCreatedSleepExercises => null;

  get userCreatedMindfullExercises => null;

  //Methode to add a new meditation
  void addMeditation(MeditationExercise meditation, BuildContext context) {
    try {
      _meditations.add(meditation);

      //also update the Hive box

      try {
        MeditationService().addMeditation(meditation, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to delete a meditation
  void deleteMeditation(MeditationExercise meditation, BuildContext context) {
    try {
      _meditations.remove(meditation);

      //also update the Hive box
      try {
        MeditationService().deleteMeditation(meditation, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to get all the meditations
  List<MeditationExercise> getMeditations() {
    try {
      //get all the meditations
      final List<MeditationExercise> allMeditatios =
          MeditationService().getMeditations();

      // print("all meditations: $allMeditatios");

      return allMeditatios;
    } catch (e) {
      print("get meditations error from provider: $e");
      return [];
    }
  }

  // Method to add a new sleep content
  void addSleepContent(SleepExercise sleepContent, BuildContext context) {
    try {
      _sleepExercises.add(sleepContent);

      //also update the Hive box
      try {
        SleepExerciseService().addSleepExercise(sleepContent, context);
      } catch (e) {
        print(e);
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to delete a sleep content
  void deleteSleepContent(SleepExercise sleepContent, BuildContext context) {
    try {
      _sleepExercises.remove(sleepContent);

      //also update the Hive box
      try {
        SleepExerciseService().deleteSleepExercise(sleepContent, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //get all the sleep exercises
  List<SleepExercise> getSleepExercises() {
    try {
      //get all the sleep exercises
      final List<SleepExercise> allSleepExercises =
          SleepExerciseService().getSleepExercises();

      print("all sleep exercises: $allSleepExercises");

      return allSleepExercises;
    } catch (e) {
      print("get sleep exercises error from provider: $e");
      return [];
    }
  }

  //Method to add a new mindfulness exercise
  void addMindfulExercise(
      MindFullnessExercise mindfulExercise, BuildContext context) {
    try {
      _mindfulExercises.add(mindfulExercise);

      //also update the Hive box
      try {
        MindFullExerciseService().addMindFullExercise(mindfulExercise, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to delete a mindfulness exercise
  void deleteMindfulExercise(MindFullnessExercise mindfulExercise) {
    try {
      _mindfulExercises.remove(mindfulExercise);

      //also update the Hive box
      try {
        MindFullExerciseService().deleteMindFullExercise(mindfulExercise);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //get all the mindfulness exercises
  List<MindFullnessExercise> getMindfulExercises() {
    try {
      //get all the mindfulness exercises
      final List<MindFullnessExercise> allMindfulExercises =
          MindFullExerciseService().getMindFullExercises();

      print("all mindfulness exercises: $allMindfulExercises");

      return allMindfulExercises;
    } catch (e) {
      print("get mindfulness exercises error from provider: $e");
      return [];
    }
  }
}
