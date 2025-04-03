import 'package:flutter/material.dart';
import 'package:mediease/models/meditation_exercise_model.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/models/sleep_exercise_model.dart';
import 'package:mediease/providers/meditation_provider.dart';
import 'package:mediease/providers/mindfull_exercise_provider.dart';
import 'package:mediease/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];
  // ignore: unused_field
  String _selectedCategory = "All";

  //get all the data from other providers
  Future<void> getData(BuildContext context) async {
    //Ensure this runs after build
    await Future.delayed(Duration.zero);

    //mindfull exercises
    final List<MindFullnessExercise> mindFullExercises =
        Provider.of<MindfullExerciseProvider>(context, listen: false)
            .mindfullExercise;

    //maditations
    final List<MeditationExercise> meditationExercises =
        Provider.of<MeditationProvider>(context, listen: false)
            .meditationExercise;

    //Sleep exercises
    final List<SleepExercise> sleepExercises =
        Provider.of<SleepExerciseProvider>(context, listen: false)
            .sleepExercise;

    _allData = [
      ...mindFullExercises,
      ...meditationExercises,
      ...sleepExercises,
    ];

    _filteredData = _allData;

    notifyListeners();
  }

  //getter
  List<dynamic> get filterData => _filteredData;

  //method to filter Data
  void filteredData(String category) {
    _selectedCategory = category;

    if (category == "All") {
      _filteredData = _allData;
    } else if (category == "MindFullness") {
      _filteredData = _allData.whereType<MindFullnessExercise>().toList();
    } else if (category == "Meditation") {
      _filteredData = _allData.whereType<MeditationExercise>().toList();
    } else if (category == "Sleep Stories") {
      _filteredData = _allData.whereType<SleepExercise>().toList();
    }

    notifyListeners();
  }

  //Method to return the selected Category
  String getSelectedCategory() {
    return _selectedCategory;
  }
}
