import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediease/providers/filter_provider.dart';
import 'package:mediease/providers/meditation_provider.dart';
import 'package:mediease/providers/mindfull_exercise_provider.dart';
import 'package:mediease/providers/sleep_exercise_provider.dart';
import 'package:mediease/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MindfullExerciseProvider()),
    ChangeNotifierProvider(create: (context) => MeditationProvider()),
    ChangeNotifierProvider(create: (context) => SleepExerciseProvider()),
    ChangeNotifierProvider(create: (context) => FilterProvider()),
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
