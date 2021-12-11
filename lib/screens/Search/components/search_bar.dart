// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/components/filter_tile.dart';
import 'package:socialdinner/screens/Search/components/search_input_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        Background(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1),
                SearchInputField(),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FilterTile(text: "Stadt"),
                    SizedBox(width: 5),
                    FilterTile(text: "Zeit"),
                    SizedBox(width: 5),
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
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
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
          color: Colors.white,
        ),
        child: Container(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/images/searchscreen_search.png',
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
