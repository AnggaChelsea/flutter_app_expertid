import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/main_page.dart';
import 'package:moviebook/widget/button_login.dart';
import 'package:http/http.dart ' as http;
import 'package:pocketbase/pocketbase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String route = "register-page";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

enum Gender {
  lakilaki,
  perempuan,
}

class _RegisterPageState extends State<RegisterPage> {
  String gender = "laki-laki";
  List<String> kelas = ['1', '2', '3'];
  String selectedKelas = '1';
  String? _selectedValue;

  doRegister() async {
    var url = Uri.https('example.com', 'whatsit/create');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

  final emailController = TextEditingController();
  final namaController = TextEditingController();
  final sekolahController = TextEditingController();
  late CollectionReference chat;

  onTapGender(Gender selectedGender) {
    if (selectedGender == Gender.lakilaki) {
      gender = "laki-laki";
    } else {
      gender = "perempuan";
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    chat = FirebaseFirestore.instance
        .collection(
          "users",
        )
        .doc(
          "kimia",
        )
        .collection('murid');
    return Scaffold(
      backgroundColor: Color(0xfff0f3f5),
      appBar: PreferredSize(
        //untuk tinggi appbar
        preferredSize:
            Size.fromHeight(kToolbarHeight + 20), //untuk tinggikan appbar
        child: AppBar(
          elevation: 0,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          backgroundColor: R.colors.colorUmum,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: const Text(
            "Yuk isi data diri",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
          ),
          child: ButtonLogin(
            onTap: () {},
            backgroundColor: R.colors.colorUmum,
            // ignore: sort_child_properties_last
            child: const Text(
              "Register Sekarang",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            borderColor: R.colors.colorUmum,
            size: Size(MediaQuery.of(context).size.width * 0.8, 20),

            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              InputRegister(
                controller: emailController,
                title: 'Email',
                hintText: 'mail@mail.com',
              ),
              const SizedBox(
                height: 30,
              ),
              InputRegister(
                controller: namaController,
                title: 'Nama Lengkap',
                hintText: "Saputra Albert",
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Jenis Kelamin",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: gender == 'laki-laki'
                                ? R.colors.colorUmum
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: R.colors.grayBorder,
                                width: 1,
                              ),
                            )),
                        onPressed: () {
                          onTapGender(Gender.lakilaki);
                        },
                        child: Text(
                          "Laki-Laki",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: gender == 'laki-laki'
                                ? Colors.white
                                : const Color(0xff2282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          onTapGender(Gender.perempuan);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == 'perempuan'
                              ? R.colors.colorUmum
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.grayBorder,
                            ),
                          ),
                        ),
                        child: Text(
                          "perempuan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: gender == 'perempuan'
                                ? Colors.white
                                : const Color(0xff2282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: const Text(
                  "Kelas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      color: Colors.white,
                      border: Border.all(color: R.colors.grayBorder)),
                  child: DropdownButton<String>(
                    value: selectedKelas,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedKelas = newValue!;
                      });
                    },
                    items: kelas.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
              const SizedBox(
                height: 30,
              ),
              InputRegister(
                controller: sekolahController,
                title: 'Nama Sekolah',
                hintText: "Nama Sekolah",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputRegister extends StatelessWidget {
  const InputRegister({Key? key, this.title, this.hintText, this.controller})
      : super(key: key);

  final String? title;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: Colors.white,
              border: Border.all(color: R.colors.grayBorder)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
