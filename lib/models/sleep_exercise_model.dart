import 'package:hive/hive.dart';

part 'sleep_exercise_model.g.dart';

@HiveType(typeId: 2)
class SleepExercise {
  @HiveField(0)
  final String category;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int duration;

  @HiveField(4)
  final String audioUrl;

  SleepExercise(
      {required this.category,
      required this.name,
      required this.description,
      required this.duration,
      required this.audioUrl});

  //Method to convert the json data in to a a SleepExercise
  factory SleepExercise.fromJson(Map<String, dynamic> json) {
    return SleepExercise(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audioUrl'],
    );
  }

  //convert SleepExercise to Json data
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audioUrl': audioUrl,
    };
  }
}
