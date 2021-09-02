import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'DoctorIntro.dart';

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
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => DoctorIntro())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Constants.primary_blue_color,
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor: Constants.primary_blue_color,
              elevation: 0.0,
            ),
            body: Container(
                decoration:
                    new BoxDecoration(color: Constants.primary_blue_color),
                child: Stack(children: <Widget>[
                  Center(
                    child: Image.asset(
                      Constants.splash_logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]))));
  }
}
