import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/constans/r.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3f5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hallo Angga",
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("Selamat Datang",
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  Image.asset(
                    R.assets.icAvatarNav,
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    // vertical: 15,
                  ),
                  height: 148,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 172, 11, 175),
                    borderRadius: BorderRadius.circular(20),
                  ), //memenuhi layar
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15,
                      ),
                      child: Text(
                        "Mau Kerjain Latihan Soal apa hari ini ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      right: -30,
                      bottom: 0,
                      child: Container(
                        child: Image.asset(
                          R.assets.icHome,
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 21,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("pilih pelajaran "),
                      TextButton(onPressed: () {}, child: Text("Lihat semua"))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 21,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Container(
                    width: 53,
                    height: 53,
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      R.assets.icAtom,
                      width: 20,
                    )),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mate Matika"),
                          Text("0/5 Soal"),
                          Stack(
                            children: [
                              Container(
                                height: 10,
                                width: double.infinity,
                              )
                            ],
                          )
                        ]),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
