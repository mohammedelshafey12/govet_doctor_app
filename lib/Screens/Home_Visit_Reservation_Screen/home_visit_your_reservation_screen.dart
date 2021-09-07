import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_your_reservation_card_item.dart';
import 'package:govet_doctor_app/Widgets/Loading_Page.dart';

import '../../constants.dart';

class HomeVisitYourReservation extends StatefulWidget {
  @override
  State<HomeVisitYourReservation> createState() => _HomeVisitYourReservationState();
}

class _HomeVisitYourReservationState extends State<HomeVisitYourReservation> {
  String uid = '';
  var doctorData;
  void initState() {
    // TODO: implement initState
    super.initState();
    User? userAuth = FirebaseAuth.instance.currentUser;
    setState(() {
      uid = userAuth!.uid;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Reservation',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Constants.homeVisitCollection)
              .where(
                Constants.homeVisitVerify,
                isEqualTo: true,
              )
              .where(
                Constants.homeVisitDoctorId,
                isEqualTo: uid,
              )
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var homeVisitReservationData = snapshot.data!.docs;
              return ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: homeVisitReservationData.length,
                itemBuilder: (context, index) {
                  return HomeVisitYourReservationCardItem(
                    index: index,
                    homeVisitReservationData: homeVisitReservationData,
                  );
                },
              );
            } else {
              return LoadingPage();
            }
          }),
    );
  }
}
