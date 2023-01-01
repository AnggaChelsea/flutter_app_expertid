import 'package:flutter/material.dart';
import 'package:moviebook/views/login_page.dart';
import 'package:moviebook/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: '/',

      routes: {
        "/": (context) => const SplashScreen(),
        "/login-page": (context) => const LoginPage(),
      },
      // initialRoute: "/",

      // home: const SplashScreen(),
    );
  }
}
