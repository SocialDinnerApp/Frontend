import 'package:flutter/material.dart';
import 'package:socialdinner/screens/MyEvents/components/event_infos.dart';

class EventTile extends StatelessWidget {
  final String imagePath;
  final String eventName;
  final String eventDesc;
  final String eventLoc;
  final String eventDate;
  final String eventPrice;
  const EventTile({
    Key? key,
    required this.imagePath,
    required this.eventName,
    required this.eventDesc,
    required this.eventLoc,
    required this.eventDate,
    required this.eventPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundTile(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 45,
            child: EventImage(
              imagePath: imagePath,
            ),
          ),
          Expanded(
            flex: 55,
            child: EventInfos(
              eventName: eventName,
              eventDesc: eventDesc,
               eventLoc: eventLoc,
              eventDate: eventDate,
              eventPrice: eventPrice,
            ),
          ),
        ],
      ),
    );
  }
}

class EventImage extends StatelessWidget {
  final String imagePath;
  const EventImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 0.5,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
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
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: size.width * 0.97,
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black26,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(3.0, 5.0),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}