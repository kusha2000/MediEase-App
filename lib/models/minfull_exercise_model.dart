class MindFullnessExercise {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionsUrl;
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
