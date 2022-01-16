// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/models/event_item.dart';
import 'package:socialdinner/screens/Search/EventDetails/event_details_screen.dart';
import 'package:socialdinner/screens/Search/components/event_infos.dart';

class EventTile extends StatelessWidget {
  final EventItem eventitem;
  const EventTile({
    Key? key,
    required this.eventitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundTile(
      eventitem: eventitem,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: EventImage(
              imagePath: 'assets/images/running_dinner.jpeg',
            ),
          ),
          Expanded(
            flex: 50,
            child: EventInfos(
              eventName: eventitem.name,
              eventDesc: eventitem.description,
              eventLoc: eventitem.city,
              eventDate: eventitem.date,
              eventPrice: eventitem.fee,
            ),
          ),
        ],
      ),
    );
  }
}

class EventImage extends StatelessWidget {
  final String imagePath;
  const EventImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 0.5,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BackgroundTile extends StatelessWidget {
  final EventItem eventitem;
  final Widget child;
  const BackgroundTile({
    Key? key,
    required this.child,
    required this.eventitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventDetailScreen(eventitem: eventitem)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black26,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(3.0, 5.0),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
