// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/Search/EventDetails/PartForm/components/rounded_button.dart';

Dialog PaymentConfirmation(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 16,
    child: Container(
      height: 400,
      width: size.width * 0.8,
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: kPrimaryMediumColor,
            ),
            child: Icon(Icons.done, color: Colors.white, size: 60),
          ),
          Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Deine Anmeldung zum Event\n \"Running Dinner Heidelberg\"\nmit deinem Teampartner\n \"ABC\"\n war erfolgreich!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                RoundedButton(text: 'OK', press: () {}),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
