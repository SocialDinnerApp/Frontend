import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';

class EventInfos extends StatelessWidget {
  final String eventName;
  final String eventDesc;
  final String eventLoc;
  final String eventDate;
  final int eventPrice;
  const EventInfos({
    Key? key,
    required this.eventName,
    required this.eventDesc,
    required this.eventLoc,
    required this.eventDate,
    required this.eventPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 20,
          child: EventName(eventName: eventName),
        ),
        Expanded(
          flex: 20,
          child: EventDescription(eventDesc: eventDesc),
        ),
        Expanded(
          flex: 60,
          child: EventHighlights(
            eventLoc: eventLoc,
            eventDate: eventDate,
            eventPrice: eventPrice,
          ),
        ),
      ],
    );
  }
}

class EventHighlights extends StatelessWidget {
  const EventHighlights({
    Key? key,
    required this.eventLoc,
    required this.eventDate,
    required this.eventPrice,
  }) : super(key: key);

  final String eventLoc;
  final String eventDate;
  final int eventPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          HighlightTile(Icons.place, eventLoc),
          HighlightTile(Icons.event, eventDate),
          HighlightTile(Icons.local_atm, "$eventPrice€"),
        ],
      ),
    );
  }

  Container HighlightTile(IconData icon, String text) {
    return Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 70,
                child:
                    Icon(icon, color: kPrimaryMediumColor, size: 35),
              ),
              Expanded(
                flex: 30,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        );
  }
}

class EventDescription extends StatelessWidget {
  const EventDescription({
    Key? key,
    required this.eventDesc,
  }) : super(key: key);

  final String eventDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        eventDesc,
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}

class EventName extends StatelessWidget {
  const EventName({
    Key? key,
    required this.eventName,
  }) : super(key: key);

  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        eventName,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
