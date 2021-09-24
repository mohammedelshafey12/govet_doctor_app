import 'package:flutter/material.dart';

import '../../constants.dart';

class VideoCallCardItem extends StatelessWidget {
  const VideoCallCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        shadowColor: Constants.primary_blue_color.withOpacity(0.5),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Constants.primary_blue_color,
                  ),
                ),
                height: height * 0.23,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    Constants.person,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calling Now ...',
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.primary_blue_color,
                        fontFamily: 'custom_font_bold',
                      ),
                    ),
                    SizedBox(height: height * 0.008,),
                    Text(
                      'Ahmed Saad Elsaid',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.008,),
                    Text(
                      '01026272813',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                        fontFamily: 'custom_font',
                      ),
                    ),
                    SizedBox(height: height * 0.008,),
                    Text(
                      'a7md.s3d.2001@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                        fontFamily: 'custom_font',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01,),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Constants.primary_blue_color,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(width: width *0.03),
                      Text(
                        'Accept Call',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
