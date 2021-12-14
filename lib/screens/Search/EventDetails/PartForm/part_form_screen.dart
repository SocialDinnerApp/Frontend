import 'package:flutter/material.dart';
import 'package:socialdinner/models/event_item.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/body.dart';

class PartFormScreen extends StatelessWidget {
  final EventItem eventitem;
  const PartFormScreen({Key? key, required this.eventitem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(eventitem: eventitem),
      appBar: AppBar(
        title: const Text('Teilnahmeformular'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
    );
  }
}
