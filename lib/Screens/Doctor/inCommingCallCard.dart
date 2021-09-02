import 'package:flutter/material.dart';
import 'package:govet_doctor_app/constants.dart';

class InCommingCallCard extends StatelessWidget {
const InCommingCallCard(
{
  required this.width,
  required this.height,
  required this.name,
  required this.petname,
  required this.petbreed,
  required this.imgUrl,
}
    );
final double width;
final double height;
final String name;
final String petname;
final String petbreed;
final String imgUrl;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      // Box Properties
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Avatar Image
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Constants.person),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              // Client name & It's pit name and breed
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: 'custom_font_bold'),
                  ),
                  SizedBox(height: height * 0.008),
                  Row(
                    children: [
                      Image.asset(
                        Constants.pawprintSolid,
                        width: 35,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        '$petname ($petbreed)',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontFamily: 'custom_font_bold'),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          //Calling answer and reject
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: width * 0.07,
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: width * 0.1,
                  ),
                ),
              ),
              Text(
                '···',
                style: TextStyle(
                    color: Colors.grey, fontSize: width * 0.15),
              ),
              Text(
                '·',
                style: TextStyle(fontSize: width * 0.15),
              ),
              Text(
                '···',
                style: TextStyle(
                    color: Colors.grey, fontSize: width * 0.15),
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: width * 0.07,
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: width * 0.1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
