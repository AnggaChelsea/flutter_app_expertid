import 'package:flutter/material.dart';
import 'package:moviebook/constans/R/app_colors.dart';
import 'package:moviebook/constans/r.dart';
import 'package:moviebook/views/register_page.dart';
import 'package:moviebook/widget/button_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String route = "login-page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3f5),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          Spacer(),
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
          SizedBox(
            height: 30,
          ),
          Text(
            R.string.loginDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Spacer(),
          ButtonLogin(
            onTap: () {
              Navigator.of(context).pushNamed(RegisterPage.route);
            },
            size: Size(MediaQuery.of(context).size.width * 0.8, 50),
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(R.assets.iconGoogle),
                SizedBox(
                  width: 15,
                ),
                Text(
                  R.string.loginGoogle,
                  style: TextStyle(
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
                SizedBox(
                  width: 15,
                ),
                Text(
                  R.string.loginWithApple,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
