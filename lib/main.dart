import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediease/pages/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MediEase App",
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
