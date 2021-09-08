import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Widgets/Loading_Page.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../constants.dart';
import 'home_screen.dart';

class WaitingVerify extends StatefulWidget {
  const WaitingVerify({Key? key}) : super(key: key);

  @override
  State<WaitingVerify> createState() => _WaitingVerifyState();
}

class _WaitingVerifyState extends State<WaitingVerify> {
  String uid = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    User? userAuth = FirebaseAuth.instance.currentUser;
    setState(() {
      uid = userAuth!.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primary_blue_color,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Constants.doctorCollection)
              .where(Constants.doctorId, isEqualTo: uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doctorData = snapshot.data!.docs[0];
              if (doctorData[Constants.doctorIsVerify]){
                return HomeScreen();
              } else {
                return Container(
                  decoration:
                  new BoxDecoration(color: Constants.primary_blue_color),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadingText(
                              'Soon...',
                              style: TextStyle(
                                  fontFamily: 'custom_font',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FadingText(
                              'We will verify your account soon...',
                              style: TextStyle(
                                  fontFamily: 'custom_font',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );

              }
            } else {
              return LoadingPage();
            }
          }),
    );
  }
}
