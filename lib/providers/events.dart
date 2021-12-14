import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/helpers.dart/get_auth_token.dart';
import 'package:socialdinner/helpers.dart/get_user_id.dart';
import 'package:socialdinner/models/event_item.dart';

class Event with ChangeNotifier {
  List<EventItem> _activeEvents = [];

  List<EventItem> get activeEvents {
    return _activeEvents;
  }

  Future<void> getActiveEvents() async {
    http.Response res;
    final uri = Uri.http(backendurl, '/api/event/getActiveEvents');
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    print('Geting Active events...');
    res = await http.get(uri, headers: headers);
    print('Statuscode: ${res.statusCode}');
    if (res.statusCode == 200) {
      final extractedData = json.decode(res.body);
      print(extractedData);

      final List<EventItem> loadedevents = [];
      extractedData.forEach((event) {
        loadedevents.add(EventItem(
          eventId: event['eventId'],
          name: event['name'],
          description: event['description'],
          org_id: event['org_Id'],
          fee: event['fee'],
          date: event['date'],
          registration_deadline: event['registration_deadline'],
          time_starter: event['time_starter'],
          time_main: event['time_main'],
          time_dessert: event['time_dessert'],
          city: event['city'],
          zip_code: event['zip_code'],
          isPublic: event['isPublic'],
          max_participants: event['max_participants'],
        ));
      });
      _activeEvents = loadedevents;
      notifyListeners();
    }
  }

  Future<bool> participate(
      int zip_code,
      String city,
      String street,
      int housenumber,
      int floor,
      String hints,
      String teammate,
      String eventId) async {
    http.Response res;

    final String? userId = await getUserId();
    print('UserId = $userId');
    final queryParameters = {
      'city': city,
      'zip_code': "${zip_code}",
      'street': street,
      'housenumber': "${housenumber}",
      'floor':  "${floor}",
      'hints': hints,
      'username_partner': teammate,
      'userId': userId,
      'eventId': eventId,
    };
    final uri = Uri.http(backendurl, '/api/participation', queryParameters);
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    res = await http.post(uri, headers: headers);
    print('Statuscode: ${res.statusCode}');
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      print(extractedData);
      notifyListeners();
      return true;
    }
    return false;
  }
}
