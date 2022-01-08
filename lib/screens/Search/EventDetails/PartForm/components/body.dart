// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/models/event_item.dart';
import 'package:socialdinner/providers/events.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/autocompleteinput.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/pay_confirmation.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/rounded_input_field.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final EventItem eventitem;
  const Body({
    Key? key,
    required this.eventitem,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int zip_code = 0;
  String city = '';
  String street = '';
  int housenumber = 0;
  int floor = 0;
  String hints = '';
  String teammate_name = '';

  bool exZipcode = false;
  bool exCity = false;
  bool exStreet = false;
  bool exHousenumber = false;
  bool exFloor = false;
  bool exTeammatename = true;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Es ist ein Fehler aufgetreten!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (zip_code != 0 &&
        city != null &&
        street != null &&
        housenumber != 0 &&
        floor != 0 &&
        teammate_name != null) {
      await Provider.of<Event>(context, listen: false)
          .participate(
        zip_code,
        city,
        street,
        housenumber,
        floor,
        hints,
        teammate_name,
        widget.eventitem.eventId,
      )
          .then(
        (success) {
          if (success) {
            showDialog(
                context: context,
                builder: (context) {
                  return PaymentConfirmation(
                      context, widget.eventitem.name, teammate_name);
                });
          } else {
            _showErrorDialog(
                'Eventteilnahme ist fehlgeschlagen. Versuchen Sie es erneut...');
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Teampartner",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Divider(color: Colors.black12, thickness: 2),
            SizedBox(height: 5),
            // RoundedInputField(
            //   width: double.infinity,
            //   hinttext: "Username des Partners",
            //   onChanged: (val) {
            //     teammate_name = val;
            //   },
            // ),
            // Start
            AutoCompleteInput(
              eventId: widget.eventitem.eventId,
              hinttext: 'Username der Partners',
              validator: (val) {
                print('Wert des Dropdowns: $val');
                final value = "$val";
                teammate_name = value;
                exTeammatename = value.isNotEmpty ? true : false;
              },
            ),
            // End
            SizedBox(height: 30),
            Text(
              "Adresse eures Gästeempfangs",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Divider(color: Colors.black12, thickness: 2),
            SizedBox(height: 10),
            TextwPad(text: "* Straße"),
            RoundedInputField(
              width: double.infinity,
              hinttext: "Straße",
              onChanged: (val) {
                street = val;
                setState(() {
                  exStreet = val.isNotEmpty ? true : false;
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextwPad(text: "* Hausnummer"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "Hausnummer",
                        onChanged: (val) {
                          housenumber = int.parse(val);
                          setState(() {
                            exHousenumber = val.isNotEmpty ? true : false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextwPad(text: "* Etage"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "Etage",
                        onChanged: (val) {
                          floor = int.parse(val);
                          setState(() {
                            exFloor = val.isNotEmpty ? true : false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextwPad(text: "* PLZ"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "PLZ",
                        onChanged: (val) {
                          zip_code = int.parse(val);
                          setState(() {
                            exZipcode = val.isNotEmpty ? true : false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextwPad(text: "* Stadt"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "Stadt",
                        onChanged: (val) {
                          city = val;
                          setState(() {
                            exCity = val.isNotEmpty ? true : false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextwPad(text: "Hinweise"),
            RoundedInputField(
              width: double.infinity,
              hinttext: "Hinweise",
              onChanged: (val) {
                hints = val;
              },
            ),
            SizedBox(height: 30),
            Text(
              "Wähle deine Zahlungsart",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Divider(color: Colors.black12, thickness: 2),
            SizedBox(height: 10),
            PaymentMethod(),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundedButton(
                    text: "BESTÄTIGEN",
                    press: _submit,
                    disabled: exTeammatename &&
                            exCity &&
                            exFloor &&
                            exHousenumber &&
                            exStreet &&
                            exZipcode
                        ? false
                        : true,
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

class TextwPad extends StatelessWidget {
  final String text;
  const TextwPad({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 3),
      child: Text(
        text,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Zahlungsmethode"),
          Icon(Icons.expand_more),
        ],
      ),
    );
  }
}
