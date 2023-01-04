import 'package:flutter/material.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/main_page.dart';
import 'package:moviebook/widget/button_login.dart';

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
  onTapGender(Gender selectedGender) {
    if (selectedGender == Gender.lakilaki) {
      gender = "laki-laki";
    } else {
      gender = "perempuan";
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Yuk isi data diri",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
          ),
          child: ButtonLogin(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MainPage.route);
            },
            backgroundColor: R.colors.buttonColor,
            child: Text(
              "Register Sekarang",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            borderColor: Colors.transparent,
            size: Size(MediaQuery.of(context).size.width * 0.8, 10),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              InputRegister(
                title: 'Email',
                hintText: 'mail@mail.com',
              ),
              SizedBox(
                height: 30,
              ),
              InputRegister(
                title: 'Nama Lengkap',
                hintText: "Saputra Albert",
              ),
              SizedBox(
                height: 30,
              ),
              Text(
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
                                ? R.colors.buttonColor
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
                                : Color(0xff2282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
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
                              ? R.colors.buttonColor
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
                                : Color(0xff2282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "Kelas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
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
              SizedBox(
                height: 30,
              ),
              InputRegister(
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
  const InputRegister({
    Key? key,
    this.title,
    this.hintText,
  }) : super(key: key);

  final String? title;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: Colors.white,
              border: Border.all(color: R.colors.grayBorder)),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
