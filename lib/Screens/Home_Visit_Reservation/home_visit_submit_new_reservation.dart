import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_card_item.dart';
import 'package:govet_doctor_app/Widgets/Loading_Page.dart';

import '../../constants.dart';

class HomeVisitSubmitNewReservationScreen extends StatelessWidget {
  const HomeVisitSubmitNewReservationScreen({
    required this.doctorId,
    required this.doctorName,
    required this.doctorPhone,
  });

  final doctorId;
  final doctorName;
  final doctorPhone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit A Reservation',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(Constants.homeVisitCollection)
            .where(Constants.homeVisitVerify, isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var homeVisitReservationData = snapshot.data!.docs;
            return ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemBuilder: (context, index) {
                return HomeVisitReservationCardItem(
                  index: index,
                  homeVisitReservationData: homeVisitReservationData,
                  doctorId: doctorId,
                  doctorName: doctorName,
                  doctorPhone: doctorPhone,
                );
              },
              itemCount: homeVisitReservationData.length,
            );
          } else {
            return LoadingPage();
          }
        },
      ),
    );
  }
}
