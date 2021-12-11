// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                "assets/images/uni_heidelberg.png",
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
                      'Dinner Universität Heidelberg',
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
                      "Hi! Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  EventLocation(),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  EventTimings(),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  EventPrice(),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  // SizedBox(height: 30),
                  RoundedButton(
                    text: "ANMELDEN",
                    press: () {},
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
  const EventPrice({
    Key? key,
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
            "7€ je angemeldetem Student",
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
  const EventTimings({
    Key? key,
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
              child: Text("31.12.2021"),
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
                      Text("17:00"),
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
                      Text("18:30"),
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
                      Text("20:00"),
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
  const EventLocation({
    Key? key,
  }) : super(key: key);

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
            "Heidelberg",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
