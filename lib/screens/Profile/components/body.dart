// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:socialdinner/screens/Login/login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String username;
  late String email;
  bool _isinit = true;

  @override
  void didChangeDependencies() {
    if (_isinit) {
      username = Provider.of<Auth>(context).username;
      email = Provider.of<Auth>(context).email;
      _isinit = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Background(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.email, color: kPrimaryMediumColor, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 40),
                    Text(
                      email,
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ],
                ),
                Divider(height: 50, color: Colors.black26, thickness: 1),
                Row(
                  children: [
                    Icon(Icons.person, color: kPrimaryMediumColor, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 40),
                    Text(
                      username,
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ],
                ),
                Divider(height: 50, color: Colors.black26, thickness: 1),
                Row(
                  children: [
                    Icon(Icons.lock, color: kPrimaryMediumColor, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 40),
                    Text(
                      "*************",
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                        text: 'ABMELDEN',
                        press: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                          Provider.of<Auth>(context, listen: false).logout();
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: 270,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.5,
                blurRadius: 3,
                offset: Offset(0.0, 5.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/images/profilepage.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 41,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black26,
                child: Icon(Icons.person, color: Colors.white, size: 50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
