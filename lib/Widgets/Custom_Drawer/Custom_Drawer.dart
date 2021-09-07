import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation/home_visit_submit_new_reservation.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation/home_visit_your_reservation_screen.dart';
import 'package:govet_doctor_app/constants.dart';
import '../Loading_Page.dart';
import 'Custom_Drawer_Header.dart';
import 'Custom_Drawer_Item.dart';
import 'log_out_alert_dialog.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    @required this.doctorData,
  });

  final doctorData;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          CustomDrawerHeader(
            profileImage: widget.doctorData[Constants.doctorImageUrl] ?? '',
            userName: widget.doctorData[Constants.doctorName],
            userEmail: widget.doctorData[Constants.doctorEmail],
          ),
          CustomDrawerItem(
            icon: Icons.notifications,
            itemTitle: 'Notification',
            onTap: () {},
          ),
          CustomDrawerItem(
            icon: Icons.person,
            itemTitle: 'Profile',
            onTap: () {},
          ),
          CustomDrawerItem(
            icon: Icons.add,
            itemTitle: 'Submit New Reservation',
            onTap: () {
              Constants.navigatorPush(
                context: context,
                screen: HomeVisitSubmitNewReservationScreen(
                  doctorId: widget.doctorData[Constants.doctorId],
                  doctorName: widget.doctorData[Constants.doctorName],
                  doctorPhone: widget.doctorData[Constants.doctorPhone],
                ),
              );
            },
          ),
          CustomDrawerItem(
            icon: Icons.menu_book,
            itemTitle: 'Your Home Visit',
            onTap: () {
              Constants.navigatorPush(
                context: context,
                screen: HomeVisitYourReservation(doctorId: widget.doctorData[Constants.doctorId]),
              );
            },
          ),
          Divider(),
          CustomDrawerItem(
            icon: Icons.logout,
            itemTitle: 'Sign Out',
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => LogOutAlertDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
