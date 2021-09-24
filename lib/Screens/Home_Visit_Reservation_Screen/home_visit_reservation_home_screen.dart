import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_home_card_item.dart';

import '../../constants.dart';
import 'home_visit_submit_new_reservation.dart';
import 'home_visit_your_reservation_screen.dart';

class HomeVisitReservationHomeScreen extends StatelessWidget {
  @override
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
              title: 'Home visit request',
              icon: Icons.add,
              onTap: () {
                Constants.navigatorPush(
                  context: context,
                  screen: HomeVisitSubmitNewReservationScreen(),
                );
              },
            ),
            SizedBox(
              height: height * 0.1,
            ),
            HomeVisitReservationHomeCardItem(
              title: 'Your Recent History',
              icon: Icons.menu_book,
              onTap: () {
                Constants.navigatorPush(
                  context: context,
                  screen: HomeVisitYourReservation(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
