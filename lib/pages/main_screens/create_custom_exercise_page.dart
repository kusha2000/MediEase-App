import 'package:flutter/material.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/widgets/meditatio_form.dart';
import 'package:mediease/widgets/mindufull_exercise_from.dart';
import 'package:mediease/widgets/sleep_content_form.dart';

class CreateExercisePage extends StatefulWidget {
  const CreateExercisePage({super.key});

  @override
  State<CreateExercisePage> createState() => _CreateExercisePageState();
}

class _CreateExercisePageState extends State<CreateExercisePage> {
  String typeOfContent = "Meditation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Custom Exercise",
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.primaryBlue),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      value: typeOfContent,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryBlue,
                      ),
                      items:
                          ["Meditation", "MindFullness", "Sleep"].map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                                fontSize: 16, color: AppColors.primaryDarkBlue),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          typeOfContent = value!;
                        });
                      },
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (typeOfContent == "Meditation")
                MeditationForm()
              else if (typeOfContent == "MindFullness")
                MindFullExerciseForm()
              else if (typeOfContent == "Sleep")
                SleepContentForm()
            ],
          ),
        ),
      )),
    );
  }
}
