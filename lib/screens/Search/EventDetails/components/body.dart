// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/models/event_item.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/part_form_screen.dart';

class Body extends StatelessWidget {
  final EventItem eventitem;
  const Body({
    Key? key,
    required this.eventitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                "assets/images/running_dinner.jpeg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: double.infinity,
              // height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      eventitem.name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Beschreibung',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      eventitem.description,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  EventLocation(eventLoc: eventitem.city),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  EventTimings(
                    date: eventitem.date,
                    time_starter: eventitem.time_starter,
                    time_main: eventitem.time_main,
                    time_dessert: eventitem.time_dessert,
                  ),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  EventPrice(eventPrice: eventitem.fee),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  // SizedBox(height: 30),
                  RoundedButton(
                    text: "ANMELDEN",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PartFormScreen(eventitem: eventitem)));
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "abbrechen",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventPrice extends StatelessWidget {
  final int eventPrice;
  const EventPrice({
    Key? key,
    required this.eventPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Icon(
            Icons.local_atm,
            color: kPrimaryMediumColor,
            size: 30,
          ),
        ),
        Expanded(
          flex: 85,
          child: Text(
            "$eventPrice€ je angemeldetem Student",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

class EventTimings extends StatelessWidget {
  final String date;
  final String time_starter;
  final String time_main;
  final String time_dessert;
  const EventTimings({
    Key? key,
    required this.date,
    required this.time_starter,
    required this.time_main,
    required this.time_dessert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 15,
              child: Icon(
                Icons.event,
                color: kPrimaryMediumColor,
                size: 30,
              ),
            ),
            Expanded(
              flex: 85,
              child: Text(date),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 15,
              child: Text(""),
            ),
            Expanded(
              flex: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text("Vorspeise"),
                      SizedBox(height: 10),
                      Text(time_starter),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    // height: double.infinity,
                    color: Colors.black26,
                  ),
                  Column(
                    children: [
                      Text("Hauptgang"),
                      SizedBox(height: 10),
                      Text(time_main),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    // height: double.infinity,
                    color: Colors.black26,
                  ),
                  Column(
                    children: [
                      Text("Nachspeise"),
                      SizedBox(height: 10),
                      Text(time_dessert),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EventLocation extends StatelessWidget {
  final String eventLoc;
  const EventLocation({Key? key, required this.eventLoc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Icon(
            Icons.place,
            color: kPrimaryMediumColor,
            size: 30,
          ),
        ),
        Expanded(
          flex: 85,
          child: Text(
            eventLoc,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
