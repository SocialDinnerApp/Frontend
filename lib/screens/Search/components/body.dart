// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/components/events.dart';
import 'package:socialdinner/components/search_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 22,
          // child: SearchBar(imagePath: 'assets/images/searchscreen_search.png',),
          child: SearchBar(imagePath: 'assets/images/profilepage.png',),
        ),
        Expanded(
          flex: 78,
          child: Events(),
        ),
      ],
    );
  }
}
