// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/models/event_item.dart';

class Body extends StatelessWidget {
  // final EventItem eventitem;
  const Body({
    Key? key,
    // required this.eventitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      "TU Darmstadt",
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
                      "TestBeschreibung Lorem Ipsum lbas dflkdf dfdfd dfkdfdf dfdfdf dfdfd",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  MenuTile(
                    menuname: 'Vorspeise',
                    name: 'Sarah Müller',
                    address: 'Oskar-Kokoschka-Straße 10a, 4.OG, 68163 Mannheim',
                    date: '31.12.2022',
                    time: '17:00',
                    hint: 'Bitte bei Schulz klingeln',
                  ),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  MenuTile(
                    menuname: 'Hauptspeise',
                    name: 'Erwin Münch',
                    address: 'Theodor-Straße 14, 1.OG, 68163 Mannheim',
                    date: '31.12.2022',
                    time: '18:00',
                    hint: '',
                  ),
                  Divider(color: Colors.black12, thickness: 3, height: 40),
                  MenuTile(
                    menuname: 'Nachspeise',
                    name: 'Lena Kalb',
                    address: 'T2 3, 4.OG, 68163 Mannheim',
                    date: '31.12.2022',
                    time: '19:00',
                    hint: 'Bitte bei Maier klingeln',
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
