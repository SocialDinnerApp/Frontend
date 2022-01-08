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
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  String emailHint = 'Bitte eine gültige Email angeben!';
  String passwordHint = 'Das Passwort muss mindestens 7 Zeichen enthalten!';
  String usernameHint = 'Der Username muss mindestens 3 Zeichen enthalten';

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isUsernameValid = false;

  bool isLoading = false;

  Future<void> _submit() async {
    if (_authData['email'] != null &&
        _authData['username'] != null &&
        _authData['password'] != null) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false)
          .signup(
        _authData['email']!,
        _authData['username']!,
        _authData['password']!,
      )
          .then(
        (value) {
          setState(() {
            isLoading = false;
          });
          if (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          } else {
            _showErrorDialog(
                'Registrierung ist fehlgeschlagen. Versuchen Sie es erneut...');
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
            ));
  }

  void _isPasswordValid(String password) {
    if (password.length >= 7) {
      setState(() {
        passwordHint = '';
        isPasswordValid = true;
      });
    } else {
      setState(() {
        passwordHint = 'Das Passwort muss mindestens 7 Zeichen enthalten!';
        isPasswordValid = false;
      });
    }
  }

  void _isEmailValid(String email) async {
    if (email.contains('@') && email.contains('.') && email.length > 5) {
      final bool emailexists = await Provider.of<Auth>(context, listen: false)
          .checkEmailExistence(email);
      if (emailexists) {
        setState(() {
          emailHint = 'Diese Email ist bereits vergeben!';
          isEmailValid = false;
        });
      } else {
        setState(() {
          emailHint = '';
          isEmailValid = true;
        });
      }
    } else {
      setState(() {
        emailHint = 'Bitte eine gültige Email angeben!';
        isEmailValid = false;
      });
    }
  }

  void _isUsernameValid(String username) async {
    if (username.length > 2) {
      final bool usernameexists =
          await Provider.of<Auth>(context, listen: false)
              .checkUsernameExistence(username);
      if (usernameexists) {
        setState(() {
          usernameHint = 'Dieser Username ist beretis vergeben!';
          isUsernameValid = false;
        });
      } else {
        setState(() {
          usernameHint = '';
          isUsernameValid = true;
        });
      }
    } else {
      setState(() {
        usernameHint = 'Der Username muss mindestens 3 Zeichen enthalten';
        isUsernameValid = false;
      });
    }
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
          SizedBox(height: size.height * 0.02),
          Image.asset(
            "assets/images/Registrierung.png",
            width: size.width * 0.8,
          ),
          SizedBox(height: size.height * 0.02),
          RoundedInputField(
            hinttext: "Deine Email",
            icon: Icons.mail,
            onChanged: (value) {
              _authData['email'] = value;
              _isEmailValid(value);
            },
          ),
          Container(
            width: size.width * 0.75,
            alignment: Alignment.centerLeft,
            child: Text(emailHint, style: TextStyle(color: kPrimaryColor)),
          ),
          RoundedInputField(
            hinttext: "Dein Username",
            icon: Icons.person,
            onChanged: (value) {
              _authData['username'] = value;
              _isUsernameValid(value);
            },
          ),
          Container(
            width: size.width * 0.75,
            alignment: Alignment.centerLeft,
            child: Text(usernameHint, style: TextStyle(color: kPrimaryColor)),
          ),
          RoundedPasswordField(
            onChanged: (value) {
              _authData['password'] = value;
              _isPasswordValid(value);
            },
          ),
          Container(
            width: size.width * 0.75,
            alignment: Alignment.centerLeft,
            child: Text(passwordHint, style: TextStyle(color: kPrimaryColor)),
          ),
          isLoading
              ? SpinKitWave(
                  color: kPrimaryColor,
                  size: size.height * 0.03,
                )
              : RoundedButton(
                  text: "REGISTRIEREN",
                  press: _submit,
                  disabled: isEmailValid && isPasswordValid && isUsernameValid
                      ? false
                      : true,
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
