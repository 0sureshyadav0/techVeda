import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_veda/consts/consts.dart';
import 'package:tech_veda/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Veda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkPurple,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.playfair().fontFamily,
      ),
      home: const HomePage(title: 'T E C H V E D A'),
    );
  }
}
