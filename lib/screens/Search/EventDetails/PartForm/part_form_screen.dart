import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/body.dart';

class PartFormScreen extends StatelessWidget {
  const PartFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        title: const Text('Teilnahmeformular'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
    );
  }
}
