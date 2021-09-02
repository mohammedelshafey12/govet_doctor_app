import 'package:flutter/material.dart';
import 'package:govet_doctor_app/constants.dart';

import 'inCommingCallCard.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

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
              // Head Text 'Calling Now...'
              Text(
                'Calling Now ...',
                style: TextStyle(
                    fontSize: width * 0.065,
                    color: Constants.primary_blue_color,
                    fontFamily: 'custom_font_bold'),
              ),
              InCommingCallCard(width: width,height: height * 0.185, name: 'Moaaz',petname: 'Kitty',petbreed: 'Moon Face', imgUrl: '',),
            ],
          ),
        ),
      ),
    );
  }
}
