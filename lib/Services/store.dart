import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Models/doctor_model.dart';
import 'package:govet_doctor_app/Screens/Home_Screen/home_screen.dart';

import '../constants.dart';

class Store {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// After Sign in Update User Information In Firebase Firestore
  addDoctor(Doctor doctor) {
    fireStore.collection(Constants.doctorCollection).doc(doctor.doctorId).set({
      Constants.doctorId: doctor.doctorId,
      Constants.doctorName: doctor.doctorName,
      Constants.doctorAge: doctor.doctorAge,
      Constants.doctorEmail: doctor.doctorEmail,
      Constants.doctorPhone: doctor.doctorPhone,
      Constants.doctorAddress: doctor.doctorAddress,
      Constants.doctorImageUrl: doctor.doctorImageUrl,
      Constants.doctorIsVerify: doctor.doctorIsVerify,
    });
  }

  verifyHomeVisitReservation(
      {
    context,
    homeVisitReservationId,
    doctorId,
    doctorName,
    doctorPhone,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Loading ...'),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
    fireStore
        .collection(Constants.homeVisitCollection)
        .doc(homeVisitReservationId)
        .update({
      Constants.homeVisitDoctorPhone: doctorPhone,
      Constants.homeVisitDoctorId: doctorId,
      Constants.homeVisitDoctorName: doctorName,
      Constants.homeVisitVerify: true,
    }).then((value) {

    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Reservation Accepted successfully",
            style: TextStyle(fontFamily: 'custom_Font',),
          ),
        ),
      );
    });
    Constants.navigatorPushAndRemove(
      context: context,
      screen: HomeScreen(),
    );
  }
}
