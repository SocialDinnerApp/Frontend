import 'package:flutter/material.dart';
import 'package:socialdinner/screens/MyEvents/components/body.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}