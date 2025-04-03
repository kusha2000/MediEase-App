import 'package:flutter/material.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MindFullExerciseDetailsPage extends StatelessWidget {
  final MindFullnessExercise mindFullnessExercise;
  const MindFullExerciseDetailsPage(
      {super.key, required this.mindFullnessExercise});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Exercise Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlack,
            letterSpacing: 0.2,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Container(
                width: double.infinity,
                color: AppColors.lightPurple.withOpacity(0.2),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Exercise name
                    Text(
                      mindFullnessExercise.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkBlue,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 12),

                    // Category and duration row
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            mindFullnessExercise.category,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryPurple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.timer,
                          size: 16,
                          color: AppColors.primaryGrey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "${mindFullnessExercise.duration} min",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Description section
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About this exercise",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      mindFullnessExercise.description,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: AppColors.primaryBlack.withOpacity(0.7),
                        letterSpacing: 0.1,
                      ),
                    ),

                    Divider(
                      height: 48,
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.2),
                    ),

                    // Instructions section
                    Text(
                      "Instructions",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Instructions list
                    ...mindFullnessExercise.instructions
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      String instruction = entry.value;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                instruction,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                  color:
                                      AppColors.primaryBlack.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _launchUrl(mindFullnessExercise.instructionsUrl);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "View Instructions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
