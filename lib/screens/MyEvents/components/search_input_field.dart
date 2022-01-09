// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:provider/provider.dart';
import 'package:socialdinner/providers/events.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(left: 5),
      width: size.width * 0.9,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kPrimaryColor, width: 1),
        ),
        color: Colors.white,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.search,
            color: kPrimaryColor,
            size: 30,
          ),
          Expanded(
            flex: 100,
            child: Container(
              margin: EdgeInsets.only(top: 19, left: 15),
              child: TextField(
                onChanged: (val) {
                  Provider.of<Event>(context, listen: false).setSearchPattern2(val);
                  print('Search-Pattern: $val');
                },
                decoration: InputDecoration(
                  hintText: "Suchen",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black26,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
