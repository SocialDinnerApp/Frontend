// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/components/filter_tile.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/Search/components/search_input_field.dart';

class SearchBar extends StatelessWidget {
  final String imagePath;
  const SearchBar({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        Background(imagePath: imagePath),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: size.height * 0.01),
                SearchInputField(),
                SizedBox(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 15),
                    FilterTile(text: "Stadt"),
                    SizedBox(width: 10),
                    FilterTile(text: "Zeit"),
                    SizedBox(width: 10),
                    FilterTile(text: "Preis"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  final String imagePath;
  const Background({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(20),
        //   bottomRight: Radius.circular(20),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: Offset(0.0, 5.0),
          ),
        ],
        color: kPrimaryMediumColor,
      ),
      child: Text(""),
    );
  }
}
