import 'package:flutter/material.dart';
import 'package:socialdinner/screens/MyEvents/EventDetails/components/body.dart';

class EventDetailScreen extends StatelessWidget {
  final String eventId;
  const EventDetailScreen({
    Key? key,
    required this.eventId,
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
      body: Body(eventId: eventId),
    );
  }
}