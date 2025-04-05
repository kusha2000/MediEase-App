import 'package:flutter/material.dart';
import 'package:mediease/models/meditation_exercise_model.dart';
import 'package:mediease/providers/custom_data_provider.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MeditationsTab extends StatelessWidget {
  const MeditationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            //Add a list of meditations here
            Consumer<CustomDataProvider>(
              builder: (context, data, child) {
                final List<MeditationExercise> meditations =
                    data.getMeditations();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: meditations.length,
                  itemBuilder: (context, index) {
                    final MeditationExercise meditation = meditations[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              meditation.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryBlue,
                              ),
                              onPressed: () {
                                data.deleteMeditation(meditation, context);
                              },
                            ),
                          ],
                        ),
                        subtitle: Text(
                          meditation.description,
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: AppColors.primaryDarkBlue.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
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
