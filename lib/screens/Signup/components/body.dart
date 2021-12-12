// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/components/already_have_an_account_check.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/components/rounded_input_field.dart';
import 'package:socialdinner/components/rounded_password_field.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/providers/auth.dart';
import 'package:socialdinner/screens/Login/login_screen.dart';
import 'package:socialdinner/screens/Signup/components/background.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (_authData['email'] != null && _authData['username'] != null && _authData['password'] != null) {
      await Provider.of<Auth>(context, listen: false)
          .signup(
            _authData['email']!,
            _authData['username']!,
            _authData['password']!,
          )
          .then(
            (value) {
              if (value)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                } else {
                  _showErrorDialog('Registrierung ist fehlgeschlagen. Versuchen Sie es erneut...');
                }
            },
          );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(context: context, builder: (ctx) => AlertDialog(
      title: Text('Es ist ein Fehler aufgetreten!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      ],
    ));
  }

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
            onChanged: (value) {
              _authData['email'] = value;
            },
          ),
          RoundedInputField(
            hinttext: "Dein Username",
            icon: Icons.person,
            onChanged: (value) {
              _authData['username'] = value;
            },
          ),
          RoundedPasswordField(
            onChanged: (value) {
              _authData['password'] = value;
            },
          ),
          RoundedButton(
            text: "REGISTRIEREN",
            press: _submit,
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
