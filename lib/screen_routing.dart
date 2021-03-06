import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:socialdinner/constants.dart';
import 'package:socialdinner/screens/MyEvents/myevents_screen.dart';
import 'package:socialdinner/screens/Profile/profile_screen.dart';
import 'package:socialdinner/screens/Search/search_screen.dart';

class ScreenRouting extends StatefulWidget {
  const ScreenRouting({Key? key}) : super(key: key);

  @override
  State<ScreenRouting> createState() => _ScreenRoutingState();
}

class _ScreenRoutingState extends State<ScreenRouting> {
  int _selectedIndex = 0;
  final screens = [
    SearchScreen(),
    MyEventsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Suche"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "My Events"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        iconSize: 30,
      ),
    );
  }
}
