import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String route = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => LoginPage()),
      // );
      Navigator.of(context).pushReplacementNamed("/login-page");
    });
    return Scaffold(
      backgroundColor: R.colors.colorUmum,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Center(
                child: Image.asset(R.assets.icSplash),
              ),
              SizedBox(
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
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
