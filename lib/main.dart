import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mediease/models/meditation_exercise_model.dart';
import 'package:mediease/models/minfull_exercise_model.dart';
import 'package:mediease/models/sleep_exercise_model.dart';
import 'package:mediease/providers/custom_data_provider.dart';

import 'package:mediease/providers/filter_provider.dart';
import 'package:mediease/providers/meditation_provider.dart';
import 'package:mediease/providers/mindfull_exercise_provider.dart';
import 'package:mediease/providers/sleep_exercise_provider.dart';
import 'package:mediease/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MeditationExerciseAdapter());
  Hive.registerAdapter(MindFullnessExerciseAdapter());
  Hive.registerAdapter(SleepExerciseAdapter());

  await Hive.openBox("meditations_data");
  await Hive.openBox("mindfull_exercises");
  await Hive.openBox("sleep_contents");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MindfullExerciseProvider()),
    ChangeNotifierProvider(create: (context) => MeditationProvider()),
    ChangeNotifierProvider(create: (context) => SleepExerciseProvider()),
    ChangeNotifierProvider(create: (context) => FilterProvider()),
    ChangeNotifierProvider(create: (context) => CustomDataProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MediEase App",
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      routerConfig: RouterClass().router,
    );
  }
}
