class MeditationExercise {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;
  final String videoUrl;

  MeditationExercise(
      {required this.category,
      required this.name,
      required this.description,
      required this.duration,
      required this.audioUrl,
      required this.videoUrl});

  //Method to convert the json data in to a a MeditationExercise
  factory MeditationExercise.fromJson(Map<String, dynamic> json) {
    return MeditationExercise(
        category: json['category'],
        name: json['name'],
        description: json['description'],
        duration: json['duration'],
        audioUrl: json['audioUrl'],
        videoUrl: json['videoUrl']);
  }

  //convert MeditationExercise to Json data
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audioUrl': audioUrl,
      'videoUrl': videoUrl,
    };
  }
}
