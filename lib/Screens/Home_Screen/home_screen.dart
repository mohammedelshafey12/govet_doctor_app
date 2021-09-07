import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:govet_doctor_app/Screens/Doctor/VideoCall.dart';
import 'package:govet_doctor_app/Screens/Home_Screen/waiting_verify.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation/home_visit_submit_new_reservation.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation/home_visit_reservation_home_screen.dart';
import 'package:govet_doctor_app/Widgets/Custom_Drawer/Custom_Drawer.dart';
import 'package:govet_doctor_app/constants.dart';
import '../Doctor/Reservations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = '';
  var doctorData;
  bool isVerify = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      User? userAuth = FirebaseAuth.instance.currentUser;
      setState(() {
        uid = userAuth!.uid;
      });
      FirebaseFirestore.instance
          .collection(Constants.doctorCollection)
          .doc(uid)
          .get()
          .then((value) {
        doctorData = value.data()!;
        isVerify = value.data()![Constants.doctorIsVerify];
        if (isVerify == false) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return WaitingVerify();
              },
            ),
          );
        }
      });
    });
  }

  int _selectedItemPosition = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      VideoCallScreen(),
      HomeVisitReservationHomeScreen(
        doctorData: doctorData,
      ),
    ];
    List titleAppBar = [
      'Video Call',
      'Home Visit',
    ];
    return Scaffold(
      backgroundColor: Constants.home_background_color,
      appBar: AppBar(
        title: Text(
          titleAppBar[_selectedItemPosition],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        padding: const EdgeInsets.all(10.0),
        snakeViewColor: Constants.primary_blue_color,
        selectedItemColor: Constants.primary_yellow_color,
        unselectedItemColor: Constants.primary_yellow_color,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Video Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'HomeVisit Reservations',
          ),
        ],
      ),
      body: widgets[_selectedItemPosition],
      drawer: CustomDrawer(
        doctorData: doctorData,
      ),
    );
  }
}
