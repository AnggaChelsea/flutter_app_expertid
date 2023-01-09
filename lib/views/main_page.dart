import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/models/event_banner.dart';
import 'package:moviebook/views/main/discussion/chat_screen.dart';
import 'package:moviebook/views/main/latihan_soal/home_page.dart';
import 'package:moviebook/views/main/profile/profile_screen.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  static String route = "main-page";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pc = PageController();
  int index = 0;

  EventBanner? eventBanner;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: R.colors.colorUmum,
        child: Expanded(
          child: Image.asset(
            R.assets.icDiscus,
            width: 30,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BuilBottomnavigation(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pc,
        children: [
          HomePage(),
          ProfileScreen(),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
  }

  Container BuilBottomnavigation() {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(
              0.6,
            ),
          ),
        ]),
        child: BottomAppBar(
          elevation: 0.0,
          color: Colors.white,
          child: Container(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        onTap: () {
                          index = 0;
                          _pc.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                          );
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              R.assets.icHomeNav,
                              height: 30,
                            ),
                            Text(
                              "Home",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        child: Column(
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Image.asset(
                                R.assets.icHomeNav,
                                height: 30,
                              ),
                            ),
                            Text(
                              "Diskusi",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        onTap: () {
                          print("profile");
                          index = 1;
                          _pc.animateToPage(
                            1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                          );
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                            ),
                            Text(
                              "Profile",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
