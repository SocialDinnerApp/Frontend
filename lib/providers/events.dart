import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/helpers/get_auth_token.dart';
import 'package:socialdinner/helpers/get_user_id.dart';
import 'package:socialdinner/models/event_item.dart';

class Event with ChangeNotifier {
  List<EventItem> _activeEvents = [];
  List<EventItem> _myEvents = [];
  Map _eventDetails = {};

  List<EventItem> get activeEvents {
    return _activeEvents;
  }

  List<EventItem> get myEvents {
    return _myEvents;
  }

  Map get eventDetails {
    return _eventDetails;
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

  Future<void> getMyEvents() async {
    http.Response res;
    final uri = Uri.http(backendurl, '/api/participant/myEvents');
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    print('Geting my events...');
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
      _myEvents = loadedevents;
      notifyListeners();
    }
  }

  Future<bool> getEventDetails(String eventId) async {
    http.Response res;
    final uri =
        Uri.http(backendurl, '/api/eventParticipation/event_details/$eventId');
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    print('Getting event details...');
    res = await http.get(uri, headers: headers);
    print('Statuscode: ${res.statusCode}');
    if (res.statusCode == 200) {
      final extractedData = json.decode(res.body);
      // print(extractedData);

      var loadedData = new Map();
      loadedData['eventName'] =
          extractedData['event_information']['event_name'];
      loadedData['eventDate'] =
          extractedData['event_information']['event_date'];
      loadedData['eventStarterTime'] =
          extractedData['event_information']['event_starter_time'];
      loadedData['eventMainTime'] =
          extractedData['event_information']['event_main_time'];
      loadedData['eventDessertTime'] =
          extractedData['event_information']['event_dessert_time'];
      loadedData['eventDescription'] =
          extractedData['event_information']['event_description'];

      loadedData['starter_name'] = extractedData['starter']['starter_name'];
      loadedData['starter_zipcode'] =
          extractedData['starter']['starter_zipcode'];
      loadedData['starter_city'] = extractedData['starter']['starter_city'];
      loadedData['starter_street'] = extractedData['starter']['starter_street'];
      loadedData['starter_housenumber'] =
          extractedData['starter']['starter_housenumber'];
      loadedData['starter_hints'] = extractedData['starter']['starter_hints'];
      loadedData['starter_floor'] = extractedData['starter']['starter_floor'];

      loadedData['main_name'] = extractedData['main']['main_name'];
      loadedData['main_zipcode'] = extractedData['main']['main_zipcode'];
      loadedData['main_city'] = extractedData['main']['main_city'];
      loadedData['main_street'] = extractedData['main']['main_street'];
      loadedData['main_housenumber'] =
          extractedData['main']['main_housenumber'];
      loadedData['main_hints'] = extractedData['main']['main_hints'];
      loadedData['main_floor'] = extractedData['main']['main_floor'];

      loadedData['dessert_name'] = extractedData['dessert']['dessert_name'];
      loadedData['dessert_zipcode'] =
          extractedData['dessert']['dessert_zipcode'];
      loadedData['dessert_city'] = extractedData['dessert']['dessert_city'];
      loadedData['dessert_street'] = extractedData['dessert']['dessert_street'];
      loadedData['dessert_housenumber'] =
          extractedData['dessert']['dessert_housenumber'];
      loadedData['dessert_hints'] = extractedData['dessert']['dessert_hints'];
      loadedData['dessert_floor'] = extractedData['dessert']['dessert_floor'];

      _eventDetails = loadedData;
      print(_eventDetails);
      notifyListeners();
      return true;
    }
    return false;
  }

  String getEventAddress(String course) {
    if (_eventDetails.containsValue('Ausstehend')) {
      return 'Ausstehend';
    } else {
      return '${_eventDetails['${course}_street']} ${_eventDetails['${course}_housenumber']}, ${_eventDetails['${course}_floor']}, ${_eventDetails['${course}_zipcode']}, ${_eventDetails['${course}_city']},';
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
      'floor': "${floor}",
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
