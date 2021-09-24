import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_card_item.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_info_card_item.dart';

import '../../constants.dart';

class HomeVisitReservationInfoScreen extends StatelessWidget {
  const HomeVisitReservationInfoScreen({
    Key? key,
    required this.reservationData,
  }) : super(key: key);
  final reservationData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Info'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          HomeVisitReservationInfoCardItem(
            title: 'Reservation Verify',
            subTitle: reservationData[Constants.homeVisitVerify]? 'Done' : 'Waiting',
          ),
          HomeVisitReservationInfoCardItem(
            title: 'Reservation Date',
            subTitle: reservationData[Constants.homeVisitDate],
          ),
          HomeVisitReservationInfoCardItem(
            title: 'User Name',
            subTitle: reservationData[Constants.userName],
          ),
          HomeVisitReservationInfoCardItem(
            title: 'User Phone',
            subTitle: '${reservationData[Constants.userPhone]}',
          ),
          HomeVisitReservationInfoCardItem(
            title: 'User Location',
            subTitle: reservationData[Constants.homeVisitAddress],
          ),
          HomeVisitReservationInfoCardItem(
            title: 'Reservation Reason',
            subTitle: reservationData[Constants.homeVisitReason],
          ),
        ],
      ),
    );
  }
}
