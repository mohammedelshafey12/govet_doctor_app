import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:govet_doctor_app/Screens/Doctor/VideoCall.dart';
import 'package:govet_doctor_app/constants.dart';
import '../Doctor/Reservations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemPosition = 0;
  List<Widget> widgets = [
    VideoCallScreen(),
    Reservations(),
  ];
  List titleAppBar = [
    'Video Call',
    'HomeVisit Reservations',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.home_background_color,
      appBar: AppBar(
        title: Text(
          titleAppBar[_selectedItemPosition],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        padding: const EdgeInsets.all(10.0),
        snakeViewColor: Constants.primary_blue_color,
        selectedItemColor: Constants.primary_yellow_color,
        unselectedItemColor: Constants.primary_yellow_color,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Video Calls'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded), label: 'Reservations'),
        ],
      ),
      body: widgets[_selectedItemPosition],
      drawer: Drawer(),
    );
  }
}
