import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/constants.dart';
import 'inCommingReserveCard.dart';

final HomeVisitRef = FirebaseFirestore.instance.collection('HomeVisitCollection');
class Reservations extends StatelessWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> _ReservationsStream =
    FirebaseFirestore.instance.collection('HomeVisitCollection').snapshots();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _ReservationsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
                children:
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
                  return inCommingReserveCard
                    (width: width,
                      height: height,
                      name: '${data['UserName']}',
                      ReasonOfVisit: 'Visit Reason',
                      date: '${data['HomeVisitDate']}',
                      address: '${data['HomeVisitAddress']}',
                    imgUrl: '${Constants.person}',
                  );
                }).toList());
          }),
    );
  }
}