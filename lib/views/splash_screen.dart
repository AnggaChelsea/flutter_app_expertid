import 'dart:async';

import 'package:flutter/material.dart';
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
      Navigator.of(context).pushNamed("/login-page");
    });
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Color(0xff01bdc2),
      body: Center(
        child: Image.asset(R.assets.icSplash),
      ),
    );
  }
}
