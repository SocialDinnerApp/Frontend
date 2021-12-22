// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/models/event_item.dart';
import 'package:provider/provider.dart';
import 'package:socialdinner/providers/events.dart';

class Body extends StatefulWidget {
  final String eventId;
  const Body({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState(eventId: eventId);
}

class _BodyState extends State<Body> {
  var isInit = true;
  final String eventId;
  _BodyState({required this.eventId});

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Event>(context).getEventDetails(eventId);
      isInit = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Event>(
      builder: (ctx, event, _) => Container(
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
                        event.eventDetails['eventName'],
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
                        event.eventDetails['eventDescription'],
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    Divider(color: Colors.black12, thickness: 3, height: 40),
                    MenuTile(
                      menuname: 'Vorspeise',
                      name: event.eventDetails['starter_name'],
                      address: event.getEventAddress('starter'),
                      date: event.eventDetails['eventDate'],
                      time: event.eventDetails['eventStarterTime'],
                      hint: event.eventDetails['starter_hints'],
                    ),
                    Divider(color: Colors.black12, thickness: 3, height: 40),
                    MenuTile(
                      menuname: 'Hauptspeise',
                      name: event.eventDetails['main_name'],
                      address: event.getEventAddress('main'),
                      date: event.eventDetails['eventDate'],
                      time: event.eventDetails['eventMainTime'],
                      hint: event.eventDetails['main_hints'],
                    ),
                    Divider(color: Colors.black12, thickness: 3, height: 40),
                    MenuTile(
                      menuname: 'Nachspeise',
                      name: event.eventDetails['dessert_name'],
                      address: event.getEventAddress('dessert'),
                      date: event.eventDetails['eventDate'],
                      time: event.eventDetails['eventDessertTime'],
                      hint: event.eventDetails['dessert_hints'],
                    ),
                    Divider(color: Colors.black12, thickness: 3, height: 40),
                    // SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Text(
                          "zurück",
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
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String menuname;
  final String name;
  final String address;
  final String date;
  final String time;
  final String hint;
  const MenuTile({
    Key? key,
    required this.menuname,
    required this.name,
    required this.address,
    required this.date,
    required this.time,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                menuname,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                color: kPrimaryMediumColor,
              ),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: size.width * 0.7,
                child: Text(name),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: kPrimaryMediumColor,
              ),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: size.width * 0.7,
                child: Text(address),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.event,
                color: kPrimaryMediumColor,
              ),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(date),
                    Text(time),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.description,
                color: kPrimaryMediumColor,
              ),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: size.width * 0.7,
                child: Text(hint),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
