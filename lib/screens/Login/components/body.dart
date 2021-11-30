// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/components/already_have_an_account_check.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/components/rounded_input_field.dart';
import 'package:socialdinner/components/rounded_password_field.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/Login/components/background.dart';
import 'package:socialdinner/screens/Signup/signup_screen.dart';

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
            'Anmelden',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: size.height * 0.06),
          Image.asset(
            'assets/images/grafik 2.png',
            width: size.width * 0.9,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hinttext: 'E-Mail Adresse',
            icon: Icons.person,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: 'ANMELDEN',
            press: () {},
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignupScreen();
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
