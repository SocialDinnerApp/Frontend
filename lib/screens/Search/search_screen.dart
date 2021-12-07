import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}