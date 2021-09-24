import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Screens/Home_Visit_Reservation_Screen/home_visit_reservation_info_screen.dart';
import 'package:govet_doctor_app/Services/store.dart';
import 'package:govet_doctor_app/Widgets/Home_Visit_Reservation/home_visit_reservation_list_tile_item.dart';
import 'package:govet_doctor_app/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomeVisitReservationCardItem extends StatelessWidget {
  const HomeVisitReservationCardItem({
    Key? key,
    required this.homeVisitReservationData,
    required this.index,
    required this.doctorId,
    required this.doctorName,
    required this.doctorPhone,
  });

  final homeVisitReservationData;
  final index;
  final doctorId;
  final doctorName;
  final
  doctorPhone;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Store _store = Store();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        shadowColor:  Constants.primary_blue_color.withOpacity(0.5),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
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
                    '${homeVisitReservationData[index][Constants.userPhone]}',
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
                title: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Constants.primary_blue_color,
                        ),
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Do You Want To Accept..?'),
                                  actions: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RaisedButton(
                                            color: Colors.green,
                                            child: Center(
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'custom_font',
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              _store.verifyHomeVisitReservation(
                                                context: context,
                                                homeVisitReservationId:
                                                    homeVisitReservationData[
                                                            index]
                                                        .reference
                                                        .id,
                                                doctorId: doctorId,
                                                doctorName: doctorName,
                                                doctorPhone: doctorPhone,
                                              );
                                               _sendNotification(homeVisitReservationData[
                                               index][Constants.userOsId]);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                          child: RaisedButton(
                                            color: Colors.red,
                                            child: Center(
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'custom_font',
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // color: Colors.white,
                          border: Border.all(
                            color: Constants.primary_blue_color,
                          )
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
                              color:Constants.primary_blue_color,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _sendNotification(String osId) {
    OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {
        'data': 'Doctor',
      },
      subtitle: 'Doctor accept ..',
      playerIds: [osId],
      content: 'Doctor ${doctorName} accept Your reservation',
    ));
  }
}
