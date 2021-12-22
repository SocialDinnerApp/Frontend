// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/components/search_bar.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/MyEvents/components/events.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: kPrimaryMediumColor,
          child: SafeArea(
            child: Container(
              height: 120,
              child: SearchBar(imagePath: 'assets/images/profilepage.png',),
            ),
          ),
        ),
        Expanded(
          flex: 80,
          // child: Text("test")
          child: Events(),
        ),
      ],
    );
  }
}