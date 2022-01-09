// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/components/already_have_an_account_check.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/components/rounded_input_field.dart';
import 'package:socialdinner/components/rounded_password_field.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/providers/auth.dart';
import 'package:socialdinner/screen_routing.dart';
import 'package:socialdinner/screens/Login/components/background.dart';
import 'package:socialdinner/screens/Signup/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };

  bool exPassword = false;
  bool exUsername = false;

  bool isLoading = false;

  Future<void> _submit() async {
    if (_authData['username'] != null && _authData['password'] != null) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false)
          .login(
        _authData['username']!,
        _authData['password']!,
      )
          .then(
        (success) {
          setState(() {
            isLoading = false;
          });
          if (success) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ScreenRouting();
                },
              ),
            );
          } else {
            _showErrorDialog(
                'Login ist fehlgeschlagen. Versuchen Sie es erneut...');
          }
        },
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
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
              hinttext: 'Username',
              icon: Icons.person,
              onChanged: (value) {
                _authData['username'] = value;
                if (value.isNotEmpty) {
                  setState(() {
                    exUsername = true;
                  });
                } else {
                  setState(() {
                    exUsername = false;
                  });
                }
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _authData['password'] = value;
                if (value.isNotEmpty) {
                  setState(() {
                    exPassword = true;
                  });
                } else {
                  setState(() {
                    exPassword = false;
                  });
                }
              },
            ),
            isLoading
                ? SpinKitWave(
                    color: kPrimaryColor,
                    size: size.height * 0.03,
                  )
                : RoundedButton(
                    text: 'ANMELDEN',
                    press: _submit,
                    disabled: exUsername && exPassword ? false : true,
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
      ),
    );
  }
}
