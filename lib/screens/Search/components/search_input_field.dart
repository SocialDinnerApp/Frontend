import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(left: 15),
      width: size.width * 0.7,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Icon(
              Icons.search,
              color: Colors.black38,
              size: 35,
            ),
          ),
          Expanded(
            flex: 90,
            child: Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              child: TextField(
                onChanged: (val) {},
                decoration: InputDecoration(
                  hintText: "Suchen",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black26,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
