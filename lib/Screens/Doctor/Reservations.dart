import 'package:flutter/material.dart';
import 'package:govet_doctor_app/constants.dart';
import 'inCommingReserveCard.dart';

class Reservations extends StatelessWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Head Text 'Reservation'
              Text(
                'Reservation',
                style: TextStyle(
                    fontSize: width * 0.065,
                    color: Constants.primary_blue_color,
                    fontFamily: 'custom_font_bold'),
              ),
              inCommingReserveCard
                (
                width: width,
                height: height * 0.185,
                name: 'Moaaz',
                petname: 'Kitty',
                petbreed: 'Moon Face',
                imgUrl: '',
                diagnoses: 'Reason of visit!Reason of visit!Reason of visit!Reason of visit!Reason of visit!Reason of visit!Reason of visit!',
                ),
            ],
          ),
        ),
      ),
    );
  }
}