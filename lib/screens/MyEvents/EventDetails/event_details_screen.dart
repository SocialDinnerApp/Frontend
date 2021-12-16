import 'package:flutter/material.dart';
import 'package:socialdinner/models/event_item.dart';
import 'package:socialdinner/screens/MyEvents/EventDetails/components/body.dart';

class EventDetailScreen extends StatelessWidget {
  // final EventItem eventitem;
  const EventDetailScreen({
    Key? key,
    // required this.eventitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventdetails"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
      // body: Body(eventitem: eventitem),
      body: Body(),
    );
  }
}