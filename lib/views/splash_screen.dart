import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/login_page.dart';
import 'package:moviebook/views/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => LoginPage()),
      // );
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      } else {
        Navigator.of(context).pushReplacementNamed("/login-page");
      }
    });
    return Scaffold(
      backgroundColor: R.colors.colorUmum,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Image.asset(R.assets.icSplash),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Belajar Sambil Main",
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
