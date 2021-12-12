// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/components/rounded_button.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/pay_confirmation.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
            RoundedInputField(
              width: double.infinity,
              hinttext: "Username des Partners",
              onChanged: (val) {},
            ),
            SizedBox(height: 30),
            Text(
              "Adresse eures Gästeempfangs",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Divider(color: Colors.black12, thickness: 2),
            SizedBox(height: 10),
            TextwPad(text: "Straße"),
            RoundedInputField(
              width: double.infinity,
              hinttext: "Straße",
              onChanged: (val) {},
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextwPad(text: "Hausnummer"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "Hausnummer",
                        onChanged: (val) {},
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
                      TextwPad(text: "Etage"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "Etage",
                        onChanged: (val) {},
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
                      TextwPad(text: "PLZ"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "PLZ",
                        onChanged: (val) {},
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
                      TextwPad(text: "Ort"),
                      RoundedInputField(
                        width: double.infinity,
                        hinttext: "Ort",
                        onChanged: (val) {},
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
              onChanged: (val) {},
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
                  RoundedButton(text: "BESTÄTIGEN", press: () {
                    showDialog(context: context, builder: (context) {
                      return PaymentConfirmation(context);
                    });
                  }),
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
