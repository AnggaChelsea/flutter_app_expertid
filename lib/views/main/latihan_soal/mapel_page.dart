import 'package:flutter/material.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/main/latihan_soal/paket_soal_page.dart';

import 'home_page.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({Key? key}) : super(key: key);
  static String route = 'mapel-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f3f5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: R.colors.colorUmum,
        title: Text('pilih mata pelajaran'),
      ),
      body: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(PaketSoalPage.route);
              },
              child: CardBelajar(),
            );
          }),
    );
  }
}
