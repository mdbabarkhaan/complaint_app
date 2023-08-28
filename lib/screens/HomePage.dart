import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/near_stations.dart';
import 'package:police_complaint_app/screens/profileScreen.dart';
import 'package:police_complaint_app/widgets/appBar.dart';
import '../constant/colors.dart';
import 'ShowAllStations.dart';
import 'complaintStatus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _PublicSignInState();
}

class _PublicSignInState extends State<HomePage> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    NearStations(),
    ShowAllStations(),
    ProfileScreen(),
  ];
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Stations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: topcolor,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
