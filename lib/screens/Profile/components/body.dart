import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Background(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.email, color: kPrimaryMediumColor, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 40),
                  Text(
                    "abc@def.com",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
              Divider(height: 50, color: Colors.black26, thickness: 1),
              Row(
                children: [
                  Icon(Icons.person, color: kPrimaryMediumColor, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 40),
                  Text(
                    "BlaBla",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
              Divider(height: 50, color: Colors.black26, thickness: 1),
              Row(
                children: [
                  Icon(Icons.lock, color: kPrimaryMediumColor, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 40),
                  Text(
                    "*************",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.asset(
          'assets/images/profilepage.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
