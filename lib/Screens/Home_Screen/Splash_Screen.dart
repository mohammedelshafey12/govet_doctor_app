import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:govet_doctor_app/Screens/Auth/log_in_screen.dart';
import 'package:govet_doctor_app/Screens/Home_Screen/home_screen.dart';
import 'package:govet_doctor_app/Screens/Home_Screen/waiting_verify.dart';
import '../../constants.dart';

class Splash_Screen extends StatefulWidget {
  static String id = 'splashid';

  @override
  Splash createState() => Splash();
}

class Splash extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    /// this fuc to wait app for build and do timer to avoid un save operations
    SchedulerBinding.instance!.addPostFrameCallback(
      (_) {
        User? userAuth = FirebaseAuth.instance.currentUser;
        Timer(
          Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                if (userAuth == null) {
                  return LogInScreen();
                } else {
                  return WaitingVerify();
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Constants.primary_blue_color),
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                Constants.splash_logo,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
