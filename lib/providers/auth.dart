import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/helpers/get_auth_token.dart';
import 'package:socialdinner/valkey.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  String? _username;
  String? _email;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  Timer? _authTimer;

  bool get isAuth {
    // print('going to return ${token != null}');
    return token != null;
  }

  dynamic get username {
    return _username;
  }

  dynamic get email {
    return _email;
  }

  dynamic get token {
    // print('Trying to get the token');
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now())) {
      // print('returning the token');
      // print(_token);
      return _token!;
    }
    return null;
  }

  Future signup(String email, String username, String password) async {
    http.Response res;
    final queryParameters = {
      'email': email,
      'username': username,
      'password': password,
      'val_key': val_key,
    };
    final uri = Uri.https(
      backendurl,
      '/api/participant',
      queryParameters,
    );

    res = await http.post(uri);

    final res_data = json.decode(res.body);
    print(res_data);
    print(res.statusCode);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }

  Future login(String username, String password) async {
    http.Response res;
    final queryParameters = {
      'username': username,
      'password': password,
    };
    final uri = Uri.https(backendurl, '/api/participant/login', queryParameters);

    res = await http.post(uri);

    final res_data = json.decode(res.body);
    print(res_data);
    print(res.statusCode);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      _token = res_data['token'];
      _userId = res_data['userId'];
      _username = res_data['username'];
      _email = res_data['email'];
      _expiryDate = dateFormat.parse(res_data['expiresAt']);
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate!.toIso8601String(),
      });
      prefs.setString('userData', userData);
      print('Storing user data in SharedPres...');
      print(prefs.getString('userData'));
      return true;
    } else {
      print('Login failed...');
      print('Statuscode: ${res.statusCode}');
      print(res.body);
      return false;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    print('Trying to get data from Shared Prefs...');
    if (!prefs.containsKey('userData')) {
      print('No Key present...');
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']!);
    print(extractedUserData);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    final secToExp = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: secToExp), logout);
  }

  Future<bool> checkEmailExistence(String email) async {
    http.Response res;

    final queryParameters = {
      'email': email,
      'val_key': val_key,
    };
    final uri = Uri.https(backendurl, '/api/emailexistence', queryParameters);
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    res = await http.get(uri, headers: headers);
    print('Statuscode: ${res.statusCode}');
    if (res.statusCode == 200) {
      final extractedData = json.decode(res.body);
      print(extractedData);

      if (extractedData['exists'] == 'true') {
        return true;
      }
      return false;
    }
    return true;
  }

  Future<bool> checkUsernameExistence(String username) async {
    http.Response res;

    final queryParameters = {
      'username': username,
      'val_key': val_key,
    };
    final uri = Uri.https(backendurl, '/api/usernameexistence', queryParameters);
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    res = await http.get(uri, headers: headers);
    print('Statuscode: ${res.statusCode}');
    if (res.statusCode == 200) {
      final extractedData = json.decode(res.body);
      print(extractedData);

      if (extractedData['exists'] == 'true') {
        return true;
      }
      return false;
    }
    return true;
  }

  Future<List<String>> getMatchingUsernames(String username, String eventId) async {
    http.Response res;
    List<String> matchingUsernames = [];

    final queryParameters = {
      'username': username,
      'val_key': val_key,
      'eventId': eventId,
    };
    final uri = Uri.https(backendurl, '/api/matchingusernames', queryParameters);
    var headers = {'Authorization': 'Bearer ${await getAuthToken()}'};

    res = await http.get(uri, headers: headers);
    print('Statuscode: ${res.statusCode}');
    if (res.statusCode == 200) {
      final extractedData = json.decode(res.body);
      // print(extractedData);
      // print(extractedData['usernames']);
      // print('Before: $matchingUsernames');
      extractedData['usernames'].forEach((element) {
        matchingUsernames.add(element);
      });
      // print('After: ');
    }
    // print(matchingUsernames);
    if (matchingUsernames.length > 10) {
      return matchingUsernames.sublist(0, 10);
    } else {
      return matchingUsernames;
    }
  }
}
