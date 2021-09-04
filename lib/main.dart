import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/Home_Screen/Splash_Screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // ignore: deprecated_member_use
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Constants.primary_blue_color,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'custom_font',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          centerTitle: true,
          backgroundColor: Constants.primary_blue_color,
          elevation: 0.0,
          titleSpacing: 20.0,
        ),
      ),
    );
  }
}
