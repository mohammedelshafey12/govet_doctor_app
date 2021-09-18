import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../constants.dart';
import 'Splash_Screen.dart';
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
              if (doctorData[Constants.doctorIsVerify]) {
                return HomeScreen();
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadingText(
                          'Soon...',
                          style: TextStyle(
                            fontFamily: 'custom_font_bold',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Constants.primary_yellow_color,

                          ),
                        ),
                        FadingText(
                          'We will verify account soon',
                          style: TextStyle(
                            fontFamily: 'custom_font_bold',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Constants.primary_yellow_color,

                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {return Scaffold(
                backgroundColor: Constants.primary_blue_color,
                body: Center(child: CircularProgressIndicator(
                  color:      Constants.primary_yellow_color,

                )),
              );}
          }),
    );
  }
}
