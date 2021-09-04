import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:govet_doctor_app/constants.dart';



class inCommingReserveCard extends StatelessWidget {
  const inCommingReserveCard({
    required this.width,
    required this.height,
    required this.name,
    required this.ReasonOfVisit,
    required this.date,
    required this.address,
    required this.imgUrl,
  });
  final double width;
  final double height;
  final String name;
  final String ReasonOfVisit;
  final String date;
  final String address;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      // Box Properties
      margin: EdgeInsets.only(left:15,right: 15,bottom: 10,top: 10),
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
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(Constants.person),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          // Client name & It's pit name and breed & address & Reservated on:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Constants.primary_blue_color,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'custom_font_bold'),
                  ),
                ],
              ),
              SizedBox(height: height * 0.003),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 30,
                    color: Constants.primary_blue_color,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    '$date',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: 'custom_font_bold'),
                  ),
                ],
              ),
              SizedBox(height: height * 0.003),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 30,
                    color: Constants.primary_blue_color,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: Text(
                      '$address',
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: 'custom_font_bold',
                          overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Icon(
                Icons.info,
                size: 30,
                color: Constants.primary_blue_color,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                child: Text(
                  '$ReasonOfVisit',
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'custom_font_bold',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: width * 0.085,
                    child: Text(
                      'Reject',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: width * 0.085,
                    child: Text(
                      'Accept',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
