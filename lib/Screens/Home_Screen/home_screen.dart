import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation_Screen/home_visit_reservation_home_screen.dart';
import 'package:govet_doctor_app/Screens/Vedio_Call_Screen/video_call_screen.dart';
import 'package:govet_doctor_app/Widgets/Custom_Drawer/Custom_Drawer.dart';
import 'package:govet_doctor_app/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    User? userAuth = FirebaseAuth.instance.currentUser;
    setState(() {
      uid = userAuth!.uid;
    });

    OneSignal.shared.setNotificationOpenedHandler((openedResult) { var data = openedResult.notification.additionalData![0]['data'];});
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
      var data = event.notification.additionalData![0]["data"];
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('Notification Opened');
      //Constants.navigatorPush(context: context,screen:NotificationWidget());
    });

    OneSignal.shared.getDeviceState().then((state) {
      DocumentReference ref = FirebaseFirestore.instance
          .collection(Constants.doctorCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid);
      print('sssssssssss${state?.userId}');
      ref.update({
        'osUserID': '${state?.userId}',
      });
    });
     _sendNotification();
  }
  _sendNotification() {
    OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {
        'data': 'Doctor',
      },
      subtitle: 'Govet..',
      playerIds: ['1ea35b78-e560-46ea-b97e-5d8633889605'],
      content: 'Doctor Mohamed accept call',
    ));
  }
  int _selectedItemPosition = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      VideoCallScreen(),
      HomeVisitReservationHomeScreen(),
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
        doctorId: uid,
      ),
    );
  }
}
