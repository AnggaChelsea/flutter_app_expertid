import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/views/auth/login_page.dart';
import 'package:moviebook/views/auth/register_page.dart';
import 'package:moviebook/views/main/latihan_soal/paket_soal_page.dart';
import 'package:moviebook/views/main_page.dart';
import 'package:moviebook/views/main/latihan_soal/mapel_page.dart';
import 'package:moviebook/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Soal',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),

      // home: '/',

      routes: {
        "/": (context) => const SplashScreen(),
        "/login-page": (context) => const LoginPage(),
        RegisterPage.route: (context) => const RegisterPage(),
        MainPage.route: (context) => MainPage(),
        MapelPage.route: (context) => MapelPage(),
        PaketSoalPage.route: (context) => PaketSoalPage(),
      },
      // initialRoute: "/",

      // home: const SplashScreen(),
    );
  }
}
