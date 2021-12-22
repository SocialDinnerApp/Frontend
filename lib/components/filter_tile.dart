import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';

class FilterTile extends StatelessWidget {
  final double width; 
  final String text;
  const FilterTile({
    Key? key,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.only(right: 10),
      // padding: EdgeInsets.only(
      //   left: 10,
      //   right: 5,
      // ),
      width: width,
      height: size.height * 0.035,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(20)),
        // border: Border.all(
        //   color: Colors.black26,
        //   width: 0.5,
        // ),
        boxShadow: [
            // BoxShadow(
            //   color: Colors.black26,
            //   spreadRadius: 0.5,
            //   blurRadius: 3,
            //   offset: Offset(0.0, 5.0),
            // ),
          ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: kPrimaryMediumColor,
              fontSize: 14,
            ),
          ),
          Icon(
                Icons.expand_more,
                color: kPrimaryMediumColor,
              ),
        ],
      ),
    );
  }
}