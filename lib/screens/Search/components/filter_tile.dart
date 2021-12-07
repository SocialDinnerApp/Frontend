import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  final String text;
  const FilterTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(
        left: 10,
        right: 5,
      ),
      width: size.width * 0.23,
      height: size.height * 0.035,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 70,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Icon(
              Icons.expand_more,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}