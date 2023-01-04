import 'package:flutter/material.dart';
import 'package:moviebook/constans/r.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  static String route = "main-page";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(),
    );
  }
}
