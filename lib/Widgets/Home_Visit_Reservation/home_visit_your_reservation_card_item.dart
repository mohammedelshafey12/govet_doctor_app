import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation/home_visit_reservation_info_screen.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_list_tile_item.dart';

import '../../constants.dart';

class HomeVisitYourReservationCardItem extends StatelessWidget {
  const HomeVisitYourReservationCardItem({
    Key? key,
    required this.homeVisitReservationData,
    required this.index,
  }) : super(key: key);
  final homeVisitReservationData;
  final index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3.0,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          title: Column(
            children: [
              HomeVisitReservationListTileItem(
                title: 'User Name',
                subTitle: homeVisitReservationData[index][Constants.userName],
                icon: Icons.person,
              ),
              HomeVisitReservationListTileItem(
                title: 'User Phone',
                subTitle:
                    '0${homeVisitReservationData[index][Constants.userPhone]}',
                icon: Icons.phone,
              ),
              HomeVisitReservationListTileItem(
                title: 'Visit Date',
                subTitle: homeVisitReservationData[index]
                    [Constants.homeVisitDate],
                icon: Icons.watch_later,
              ),
              HomeVisitReservationListTileItem(
                title: 'User Location',
                subTitle: homeVisitReservationData[index]
                    [Constants.homeVisitAddress],
                icon: Icons.location_on,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                title: Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Constants.primary_yellow_color,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Constants.navigatorPush(
                          context: context,
                          screen: HomeVisitReservationInfoScreen(
                            reservationData: homeVisitReservationData[index],
                          ),
                        );
                      },
                      child: Text(
                        'Show More Details',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
