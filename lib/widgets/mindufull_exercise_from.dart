import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/widgets/reusable/text_input.dart';

class MindFullExerciseForm extends StatefulWidget {
  MindFullExerciseForm({super.key});

  @override
  State<MindFullExerciseForm> createState() => _MindFullExerciseFormState();
}

class _MindFullExerciseFormState extends State<MindFullExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  String category = "";
  String name = "";
  String description = "";
  List<String> instructions = [];
  int duration = 0;
  String instructionsUrl = "";
  File? imagepath;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        imagepath = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Create a new mindfull exercise',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryPurple,
          ),
        ),
        const SizedBox(height: 30),
        Form(
          key: _formKey,
          child: Column(
            children: [
              if (imagepath != null)
                Image.file(
                  imagepath!,
                  height: 200,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: const Text('Pick from Camera'),
                  ),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: const Text('Pick from Gallery'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Category',
                onSaved: (value) {
                  category = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Name',
                onSaved: (value) {
                  name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Description',
                onSaved: (value) {
                  description = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Instructions',
                onSaved: (value) {
                  instructions = value!.split(',');
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter instructions';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Duration',
                onSaved: (value) {
                  duration = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Instructions Url',
                onSaved: (value) {
                  instructionsUrl = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an instructions url';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.primaryPurple,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              onPressed: () {
                print(
                    "$imagepath $instructionsUrl $duration $instructions $description $name $category");
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
