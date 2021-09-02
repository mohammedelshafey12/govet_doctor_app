import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:govet_doctor_app/Screens/Doctor/VideoCall.dart';
import 'package:govet_doctor_app/constants.dart';
import 'Reservations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemPosition = 1;
  List<Widget> widgets = [
    VideoCallScreen(), Reservations()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.home_background_color,
      appBar: AppBar(
        backgroundColor: Constants.primary_blue_color,
        title: Text(
          _selectedItemPosition == 0
              ? "Video Call"
              : "Reservations",
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.all(10),
        snakeViewColor: Constants.primary_blue_color,
        selectedItemColor: Constants.primary_yellow_color,
        unselectedItemColor: Constants.primary_yellow_color,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Video Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: 'Reservations'),
        ],
      ),
      body: widgets[_selectedItemPosition],
      drawer: Drawer(),
    );
  }
}
