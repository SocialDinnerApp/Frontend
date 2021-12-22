import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/MyEvents/components/body.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Suche Eventlokationen"),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.search),
      //     ),
      //   ],
      //   backgroundColor: kPrimaryColor,
      // ),
      body: Body(),
    );
  }
}
