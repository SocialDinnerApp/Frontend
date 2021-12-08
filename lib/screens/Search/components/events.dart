// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/components/event_tile.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          EventTile(
            imagePath: 'assets/images/uni_heidelberg.png',
            eventName: "Dinner Universität Heidelberg",
            eventDesc:
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et ...",
            eventLoc: 'Heidelberg',
            eventDate: '31.12.2022',
            eventPrice: '7',
          ),
          EventTile(
            imagePath: 'assets/images/uni_heidelberg.png',
            eventName: "Dinner Universität Mannheim",
            eventDesc:
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et ...",
            eventLoc: 'Mannheim',
            eventDate: '01.01.2022',
            eventPrice: '6',
          ),
        ],
      ),
    );
  }
}
