import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/components/search_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: SearchBar(),
          ),
          Expanded(
            flex: 80,
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
