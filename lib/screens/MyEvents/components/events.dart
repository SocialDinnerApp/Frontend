// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/providers/events.dart';
import 'package:socialdinner/screens/MyEvents/components/event_tile.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Event>(context).getMyEvents();
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Future<void> _refresh() {
    return Provider.of<Event>(context, listen: false).getMyEvents();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Event>(
      builder: (ctx, event, _) => MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: RefreshIndicator(
          backgroundColor: Colors.white,
          color: kPrimaryMediumColor,
          onRefresh: _refresh,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: event.myEvents.length,
              itemBuilder: (BuildContext ctx, int i) {
                // return EventTile(
                //   eventItem: event.myEvents[i],
                // );
                return event.myEvents[i].name.toLowerCase().contains(event.searchPattern2.toLowerCase()) ? EventTile(
                  eventItem: event.myEvents[i],
                ) : SizedBox();
              }),
        ),
      ),
    );
  }
}
