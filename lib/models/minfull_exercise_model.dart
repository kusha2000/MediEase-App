import 'package:hive/hive.dart';

part 'minfull_exercise_model.g.dart';

@HiveType(typeId: 1)
class MindFullnessExercise {
  @HiveField(0)
  final String category;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> instructions;

  @HiveField(4)
  final int duration;

  @HiveField(5)
  final String instructionsUrl;

  @HiveField(6)
  final String imagePath;

  MindFullnessExercise({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

  //Method to convert the json data in to a a MinFulnessExercises
  factory MindFullnessExercise.fromJson(Map<String, dynamic> json) {
    return MindFullnessExercise(
        category: json['category'],
        name: json['name'],
        description: json['description'],
        instructions: List<String>.from(json['instructions']),
        duration: json['duration'],
        instructionsUrl: json['instructionsUrl'],
        imagePath: json['imagePath']);
  }

  //convert MindFulnessExercises to Json data
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'instructions': instructions,
      'duration': duration,
      'instructionsUrl': instructionsUrl,
      'imagePath': imagePath,
    };
  }
}
