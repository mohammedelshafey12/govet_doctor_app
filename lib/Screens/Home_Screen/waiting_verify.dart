import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../constants.dart';

class WaitingVerify extends StatelessWidget {
  const WaitingVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primary_blue_color,
      body: SafeArea(
        child: Container(
          decoration: new BoxDecoration(color: Constants.primary_blue_color),
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
        ),
      ),
    );
  }
}
