import 'package:flutter/material.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/widgets/reusable/text_input.dart';

class MeditationForm extends StatefulWidget {
  MeditationForm({super.key});

  @override
  State<MeditationForm> createState() => _MeditationFormState();
}

class _MeditationFormState extends State<MeditationForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = '';
  String _name = '';
  String _description = '';
  int _duration = 0;
  String _audioUrl = '';
  String _videoUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      //form
      children: [
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Create a new meditation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryPurple,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  labelText: 'Category',
                  hintText: 'Category',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _category = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Description',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Duration',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a duration';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _duration = int.parse(value!);
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Audio Url',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an audio url';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _audioUrl = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Video Url',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a video url';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _videoUrl = value!;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.primaryPurple,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print(
                            "$_videoUrl $_audioUrl $_duration $_description $_duration $_name $_category");
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
            ),
          ),
        )
      ],
    );
  }
}
