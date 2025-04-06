import 'package:flutter/material.dart';
import 'package:mediease/services/meditation_service.dart';
import 'package:mediease/services/mindfull_exercise_service.dart';
import 'package:mediease/services/sleep_exercise_service.dart';
import 'package:mediease/utils/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profiles",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Here are your custom exercises',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSectionTitle('Meditations'),
                  _buildMeditationList(context),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Sleep Content'),
                  _buildSleepContentList(context),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Mindfulness Exercises'),
                  _buildMindfulnessExerciseList(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMeditationList(BuildContext context) {
    final meditations = MeditationService().getMeditations();
    if (meditations.isEmpty) {
      return const Text('No meditations created.');
    }
    return Column(
      children: meditations.map((meditation) {
        return _buildContentTile(
          title: meditation.name,
          description: meditation.description,
          duration: meditation.duration,
          type: "MeditationExercise",
        );
      }).toList(),
    );
  }

  Widget _buildSleepContentList(BuildContext context) {
    final sleepContents = SleepExerciseService().getSleepExercises();
    if (sleepContents.isEmpty) {
      return const Text('No sleep content created.');
    }
    return Column(
      children: sleepContents.map((sleepContent) {
        return _buildContentTile(
          title: sleepContent.name,
          description: sleepContent.description,
          duration: sleepContent.duration,
          type: "SleepExercise",
        );
      }).toList(),
    );
  }

  Widget _buildMindfulnessExerciseList(BuildContext context) {
    final exercises = MindFullExerciseService().getMindFullExercises();
    if (exercises.isEmpty) {
      return const Text('No mindfulness exercises created.');
    }
    return Column(
      children: exercises.map((exercise) {
        return _buildContentTile(
          title: exercise.name,
          description: exercise.description,
          duration: exercise.duration,
          type: "MindFullExercise",
        );
      }).toList(),
    );
  }

  Widget _buildContentTile({
    required String title,
    required String description,
    required int duration,
    required String type,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: type == "MindFullExercise"
          ? AppColors.lightGreen
          : type == "SleepExercise"
              ? AppColors.lightPeach
              : AppColors.lightPurple,
      child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "${duration}min",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          )),
    );
  }
}
