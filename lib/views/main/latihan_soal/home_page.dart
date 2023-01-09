import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/models/event_banner.dart';
import 'package:moviebook/views/main/latihan_soal/mapel_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventBanner? eventBanner;

  getEventData() async {
    var headers = {
      'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3',
    };

    var url = Uri.parse('https://api.widyaedu.com/event/list?limit=10');
    var response = await http.get(url, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final dataEvent = jsonDecode(response.body);
      eventBanner = EventBanner.fromJson(dataEvent);
      setState(() {});
    }
  }

  @override
  int itemCount = 10;
  void initState() {
    super.initState();
    getEventData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f3f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidgetProfileWelcome(),
              WidgetBanner(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 21,
                ),
                child: WidgetCategory(),
              ),
              CardBelajar(),
              CardBelajar(),
              CardBelajar(),
              CardBelajar(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Terbaru",
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                margin: EdgeInsets.all(
                  10,
                ),
                child: eventBanner == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: eventBanner!.data!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final currentEvent = eventBanner!.data![index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.network(currentEvent.eventImage!)),
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetCategory extends StatelessWidget {
  const WidgetCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("pilih pelajaran "),
            Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MapelPage.route);
                },
                child: const Text(
                  "Lihat semua",
                ))
          ],
        ),
      ],
    );
  }
}

class WidgetProfileWelcome extends StatelessWidget {
  const WidgetProfileWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
    );
  }
}

class WidgetBanner extends StatelessWidget {
  const WidgetBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            // vertical: 15,
          ),
          height: 158,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 172, 11, 175),
            borderRadius: BorderRadius.circular(20),
          ), //memenuhi layar
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: const Text(
                  "Mau Kerjain Latihan Soal apa hari ini ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  child: Image.asset(R.assets.icMotor, width: 125),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBelajar extends StatelessWidget {
  const CardBelajar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 21,
      ),
      margin: const EdgeInsets.only(
        bottom: 18,
        left: 15,
        right: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Container(
            width: 53,
            height: 53,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              R.assets.icAtom,
              width: 20,
            )),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Mate Matika",
                style: GoogleFonts.poppins()
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "0/5 Paket Latihan Soal",
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: const Color.fromARGB(255, 144, 141, 141)),
              ),
              const SizedBox(
                height: 12,
              ),
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: R.colors.colorUmum),
                  ),
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
