import 'package:flutter/material.dart';
import 'package:socialdinner/screens/Search/components/filter_tile.dart';
import 'package:socialdinner/screens/Search/components/search_input_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundTile(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 25,
            child: TopRow(),
          ),
          Expanded(
            flex: 40,
            child: CenterRow(),
          ),
          Expanded(
            flex: 35,
            child: BottomRow(),
          ),
        ],
      ),
    );
  }
}

class BottomRow extends StatelessWidget {
  const BottomRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FilterTile(text: "Stadt"),
          FilterTile(text: "Zeit"),
          FilterTile(text: "Preis"),
        ],
      ),
    );
  }
}

class CenterRow extends StatelessWidget {
  const CenterRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SearchInputField(),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Icon(Icons.tune, color: Colors.black45, size: 30),
        ),
      ],
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class BackgroundTile extends StatelessWidget {
  final Widget child;
  const BackgroundTile({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(3.0, 3.0),
          ),
        ],
      ),
      child: child,
    );
  }
}
