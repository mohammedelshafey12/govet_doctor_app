import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_card_item.dart';
import 'package:govet_doctor_app/Widgets/Loading_Page.dart';

import '../../constants.dart';

class HomeVisitSubmitNewReservationScreen extends StatefulWidget {

  @override
  State<HomeVisitSubmitNewReservationScreen> createState() => _HomeVisitSubmitNewReservationScreenState();
}

class _HomeVisitSubmitNewReservationScreenState extends State<HomeVisitSubmitNewReservationScreen> {
  String uid = '';
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
                return StreamBuilder<QuerySnapshot>(
                  stream:  FirebaseFirestore.instance
                      .collection(Constants.doctorCollection).where(Constants.doctorId, isEqualTo: uid).snapshots(),
                  builder: (context1, snapshot1) {
                    if(snapshot1.hasData){
                      var doctorData = snapshot1.data!.docs[0];
                      return HomeVisitReservationCardItem(
                        index: index,
                        homeVisitReservationData: homeVisitReservationData,
                        doctorId: uid,
                        doctorName: doctorData[Constants.doctorName],
                        doctorPhone: doctorData[Constants.doctorPhone],
                      );
                    } else {
                      return LoadingPage();
                    }
                  }
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
