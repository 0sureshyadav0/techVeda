import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tech_veda/consts/consts.dart';
import 'package:tech_veda/features/version/provider/version_provider.dart';
import 'package:tech_veda/firebase_options.dart';
import 'package:tech_veda/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VersionProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<VersionProvider>(context, listen: false);
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
