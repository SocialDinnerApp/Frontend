import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/Search/EventDetails/components/body.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventdetails"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
      body: Body(),
    );
  }
}