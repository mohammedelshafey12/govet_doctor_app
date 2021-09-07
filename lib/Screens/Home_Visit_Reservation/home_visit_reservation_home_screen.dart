import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation/home_visit_submit_new_reservation.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_home_card_item.dart';

import '../../constants.dart';
import 'home_visit_your_reservation_screen.dart';

class HomeVisitReservationHomeScreen extends StatelessWidget {
  HomeVisitReservationHomeScreen({
    required this.doctorData,
  });

  var doctorData;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: height * 0.7,
        width: width * 0.7,
        child: Column(
          children: [
            HomeVisitReservationHomeCardItem(
              title: 'Submit New Reservation',
              icon: Icons.add,
              onTap: () {
                Constants.navigatorPush(
                  context: context,
                  screen: HomeVisitSubmitNewReservationScreen(
                    doctorId: doctorData[Constants.doctorId],
                    doctorName: doctorData[Constants.doctorName],
                    doctorPhone: doctorData[Constants.doctorPhone],
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.1,
            ),
            HomeVisitReservationHomeCardItem(
              title: 'Show Your Reservation',
              icon: Icons.menu_book,
              onTap: () {
                Constants.navigatorPush(
                  context: context,
                  screen: HomeVisitYourReservation(
                    doctorId: doctorData[Constants.doctorId],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
