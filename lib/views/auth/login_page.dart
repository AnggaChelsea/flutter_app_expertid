import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviebook/constans/R/app_colors.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/helpers/user_email.dart';
import 'package:moviebook/models/network_response.dart';
import 'package:moviebook/models/user_byemail.dart';
import 'package:moviebook/repository/auth_api.dart';
import 'package:moviebook/views/auth/register_page.dart';
import 'package:moviebook/views/main/latihan_soal/home_page.dart';
import 'package:moviebook/views/main_page.dart';
import 'package:moviebook/widget/button_login.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String route = "login-page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f3f5),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          const Spacer(),
          Image.asset(
            R.assets.imgLogin,
            width: 150,
          ),
          Text(
            R.string.welcome,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: R.colors.textColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            R.string.loginDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          ButtonLogin(
            onTap: () async {
              // Navigator.of(context).pushNamed(RegisterPage.route);
              await signInWithGoogle();
              final user = UserEmail.getUserEmail();
              if (user != null) {
                final dataUser = await AuthApi().getUserByEmail();
                if (dataUser?.status != Status.success) {
                  final data = UserByEmail.fromJson(dataUser!.data!);
                  if (data == 1) {
                    print(data);
                    Navigator.of(context).pushReplacementNamed(MainPage.route);
                  } else {
                    print(data);
                    Navigator.of(context).pushNamed(RegisterPage.route);
                  }
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Gagal Masuk"),
                  duration: Duration(seconds: 2),
                ));
              }
            },
            size: Size(MediaQuery.of(context).size.width * 0.8, 50),
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(25),
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(R.assets.iconGoogle),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  R.string.loginGoogle,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            borderColor: R.colors.primaryColor,
          ),
          ButtonLogin(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            backgroundColor: Colors.black,
            borderColor: Colors.black,
            size: Size(MediaQuery.of(context).size.width * 0.8, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(R.assets.icApple),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  R.string.loginWithApple,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ButtonLogin(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(RegisterPage.route);
            },
            backgroundColor: R.colors.colorUmum.withOpacity(0.5),
            borderColor: R.colors.colorUmum.withOpacity(0.5),
            size: Size(MediaQuery.of(context).size.width * 0.8, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Login Dengan Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
