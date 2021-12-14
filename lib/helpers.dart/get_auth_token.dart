import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    // print('Trying to get data from Shared Prefs...');
    if (!prefs.containsKey('userData')) {
      // print('No Key present...');
      return '';
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    // print(extractedUserData);
    final token = extractedUserData['token'];
    // print(token);
    return token;
  }