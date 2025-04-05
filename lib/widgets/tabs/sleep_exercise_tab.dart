import 'package:flutter/material.dart';
import 'package:mediease/models/sleep_exercise_model.dart';
import 'package:mediease/providers/custom_data_provider.dart';
import 'package:mediease/utils/colors.dart';
import 'package:provider/provider.dart';

class SleepExercisesTab extends StatelessWidget {
  const SleepExercisesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //Add a list of meditations here
            Consumer<CustomDataProvider>(
              builder: (context, data, child) {
                final List<SleepExercise> sleepData = data.getSleepExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sleepData.length,
                  itemBuilder: (context, index) {
                    final SleepExercise sleepContent = sleepData[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.lightPeach,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(sleepContent.name),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryBlue,
                              ),
                              onPressed: () {
                                data.deleteSleepContent(sleepContent, context);
                              },
                            ),
                          ],
                        ),
                        subtitle: Text(sleepContent.description),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
