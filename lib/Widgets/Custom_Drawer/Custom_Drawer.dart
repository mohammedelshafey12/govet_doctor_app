import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation_Screen/home_visit_reservation_home_screen.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation_Screen/home_visit_submit_new_reservation.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation_Screen/home_visit_your_reservation_screen.dart';
import 'package:govet_doctor_app/constants.dart';
import '../Loading_Page.dart';
import 'Custom_Drawer_Header.dart';
import 'Custom_Drawer_Item.dart';
import 'log_out_alert_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.doctorId,
  });

  final doctorId;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Constants.doctorCollection)
              .where(
                Constants.doctorId,
                isEqualTo: doctorId,
              )
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doctorData = snapshot.data!.docs[0];
              return ListView(
                children: [
                  CustomDrawerHeader(
                    userName: doctorData[Constants.doctorName],
                    userEmail: doctorData[Constants.doctorEmail],
                    profileImage: doctorData[Constants.doctorImageUrl],
                  ),

                  CustomDrawerItem(
                    icon: Icons.home,
                    itemTitle: 'Home Visit',
                    onTap: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: Scaffold(
                          appBar: AppBar(
                            title: Text('Home Visit'),
                          ),
                          body: HomeVisitReservationHomeScreen(),
                        ),
                      );
                    },
                  ),
                  CustomDrawerItem(
                    icon: Icons.add_box_rounded,
                    itemTitle: 'New Reservation',
                    onTap: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: HomeVisitSubmitNewReservationScreen(),
                      );
                    },
                  ),
                  CustomDrawerItem(
                    icon: Icons.menu_book,
                    itemTitle: 'Your Reservation',
                    onTap: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: HomeVisitYourReservation(),
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
              );
            } else {
              return LoadingPage();
            }
          }),
    );
  }
}
