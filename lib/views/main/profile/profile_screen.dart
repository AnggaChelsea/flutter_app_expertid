import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/login_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: R.colors.colorUmum,
        title: const Text('Akun Saya'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            //color harus masuk di dalam decoration
            decoration: BoxDecoration(
                color: R.colors.colorUmum,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                )),
            padding: const EdgeInsets.only(
              top: 28,
              bottom: 60,
              right: 15,
              left: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Angga',
                        style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Universitas Nusaputra',
                        style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  R.assets.icAvatarNav,
                  height: 50,
                  width: 50,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity, //iini artisnya full width
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ]),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Identitas Diri',
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Angga Lesmana',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          //ontap logout
          GestureDetector(
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              await Navigator.of(context).pushNamedAndRemoveUntil(
                '/login-page',
                (route) => false,
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  "Keluar",
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // trailing: Icon(Icons.exit_to_app,), //ini untuk bagian depan
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
