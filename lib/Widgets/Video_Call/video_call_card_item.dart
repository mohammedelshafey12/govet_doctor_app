import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Services/store.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class VideoCallCardItem extends StatelessWidget {
  VideoCallCardItem({Key? key,this.data,required this.docId,required this.doctorName,required this.doctorId,required this.userOsId}) : super(key: key);
  var data;
  String docId;
  String doctorName;
  String doctorId;
  String userOsId;
  Store _store =Store();
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
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                height: height * 0.3,
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
              Text(
                'Calling Now ...',
                style: TextStyle(
                  fontSize: 20,
                  color: Constants.primary_blue_color,
                  fontFamily: 'custom_font_bold',
                ),
              ),
              SizedBox(height: height * 0.005,),
              Text(
                '${data[Constants.userName]}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.005,),
              Text(
                '${data[Constants.userOsId]}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                  fontFamily: 'custom_font',
                ),
              ),
              SizedBox(height: height * 0.005,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Constants.primary_blue_color,
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        content: Text("Are you sure to confirm this call?"),
                        actions: [
                          RaisedButton(
                            color: Colors.green,
                            child: Center(
                              child: Text("Yes"),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _sendNotification(userOsId);
                              _store.verifyCall(context, docId,doctorName,doctorId);
                            },
                          ),
                          RaisedButton(
                            color: Colors.red,
                            child: Center(
                              child: Text("No"),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
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
  _sendNotification(String userOsId) {
    OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {
        'data': 'Doctor',
      },
      subtitle: 'Govet..',
      playerIds: ['1ea35b78-e560-46ea-b97e-5d8633889605'],
      content: 'Doctor accept call',
    ));
  }
}
