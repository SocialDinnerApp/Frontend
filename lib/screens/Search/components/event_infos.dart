import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';

class EventInfos extends StatelessWidget {
  final String eventName;
  final String eventDesc;
  final String eventLoc;
  final String eventDate;
  final String eventPrice;
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
          flex: 30,
          child: EventDescription(eventDesc: eventDesc),
        ),
        Expanded(
          flex: 50,
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
  final String eventPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 60,
                  child:
                      Icon(Icons.place, color: kPrimaryMediumColor, size: 35),
                ),
                Expanded(
                  flex: 40,
                  child: Text(
                    eventLoc,
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 60,
                  child:
                      Icon(Icons.event, color: kPrimaryMediumColor, size: 35),
                ),
                Expanded(
                  flex: 40,
                  child: Text(
                    eventDate,
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 60,
                  child: Icon(Icons.local_atm,
                      color: kPrimaryMediumColor, size: 35),
                ),
                Expanded(
                  flex: 40,
                  child: Text(
                    '${eventPrice}€',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
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
