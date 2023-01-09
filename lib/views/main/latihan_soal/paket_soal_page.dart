import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/constans/r.dart';

class PaketSoalPage extends StatefulWidget {
  const PaketSoalPage({Key? key}) : super(key: key);
  static String route = 'paket_soal_page';

  @override
  _PaketSoalPageState createState() => _PaketSoalPageState();
}

class _PaketSoalPageState extends State<PaketSoalPage> {
  @override
  Widget build(BuildContext context) {
    final dataKosong = null;
    return Scaffold(
      backgroundColor: R.colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: R.colors.colorUmum,
        title: Text("paket soal"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Pilih Paket Soal",
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: dataKosong == null
                ? Column(
                    children: [
                      Spacer(),
                      Center(
                        child: Image.asset(R.assets.dataKosong),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          "Yah, Paket tidak tersedia",
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Tenang, masih banyak yang bisa kamu pelajari.cari lagi yuk!",
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                          )),
                      Spacer(),
                    ],
                  )
                : Container(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 1,
                      childAspectRatio: 4 /
                          3, //ini artinya menguukur lebar dan ketinggian, lebar 4 di bagi ketinggian 3
                      children: [
                        PaketSoal(),
                        PaketSoal(),
                        PaketSoal(),
                      ],
                    ),
                  ),
          ),
        ],
      ), //corsasignalimnt itu untuk berapa grid ke pinggirnya
    );
  }
}

class PaketSoal extends StatelessWidget {
  const PaketSoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.blue.withOpacity(0.5)),
                  padding: EdgeInsets.all(12),
                  child: Image.asset(
                    R.assets.icNote,
                    width: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "AlJabar",
                  style: GoogleFonts.poppins().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Paket Lokas",
                  style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
