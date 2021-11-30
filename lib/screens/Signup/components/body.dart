// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/components/already_have_an_account_check.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/components/rounded_input_field.dart';
import 'package:socialdinner/components/rounded_password_field.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/Login/login_screen.dart';
import 'package:socialdinner/screens/Signup/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Registrieren',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Image.asset(
            "assets/images/Registrierung.png",
            width: size.width * 0.9,
          ),
          RoundedInputField(
            hinttext: "Deine Email",
            icon: Icons.person,
            onChanged: (value) {},
          ),
          RoundedInputField(
            hinttext: "Dein Username",
            icon: Icons.person,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "REGISTRIEREN",
            press: () {},
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
