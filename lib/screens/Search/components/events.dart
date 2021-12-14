// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:socialdinner/providers/events.dart';
import 'package:socialdinner/screens/Search/components/event_tile.dart';
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
      Provider.of<Event>(context).getActiveEvents();
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Event>(
      builder: (ctx, event, _) => Container(
        width: size.width * 0.96,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: event.activeEvents.length,
              itemBuilder: (BuildContext ctx, int i) {
                return EventTile(
                  eventitem: event.activeEvents[i],
                );
              }),
        ),
      ),
    );
  }
}
