import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Constants {
  static const String agouraId = 'd004bdf5771e439c96f5f558b7aae997';

  ///firebase Collections
  static const String userCollection = 'Users';
  static const String petCollection = 'Pets';
  static const String homeVisitCollection = 'HomeVisitCollection';

  /// Firebase Constants
  static const String userName = 'UserName';
  static const String userPhone = 'UserPhone';
  static const String userId = 'UserId';
  static const String userAge = 'UserAge';
  static const String userImageUrl = 'UserImageUrl';
  static const String homeVisitDate = 'HomeVisitDate';
  static const String homeVisitAddress = 'HomeVisitAddress';
  static const String homeVisitReason = 'HomeVisitReason';
  static const String homeVisitDoctorId = 'HomeVisitDoctorId';
  static const String homeVisitDoctorName = 'HomeVisitDoctorName';
  static const String homeVisitDoctorPhone = 'HomeVisitDoctorPhone';
  static const String petId = 'PetId';
  static const String petName = 'PetName';
  static const String petBreed = 'PetBreed';
  static const String petGender = 'PetGender';
  static const String petUrlImage = 'PetUrlImage';
  static const String petAge = 'PetAge';
  static const String petWeight = 'PetWeight';
  static const String petHeight = 'PetHeight';
  static const String petAdditionalNote = 'PetAdditionalNote';

  /// constants app colors
  static const Color primary_blue_color = Color(0xfff25265E);
  static const Color primary_yellow_color = Color(0xfffF79B23);
  static const Color home_background_color = Color(0xfffF6F8FC);

  /// constants images
  static const String splash_logo = 'images/splash_logo.png';
  static const String doctorwithdog = 'images/doctorwithdog.png';
  static const String pawprintSolid = 'images/pawprintSolid.png';
}

NavigationR(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (conext) => widget));
}

NavigationP(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (conext) => widget));
}

Widget grey_title_text({
  required String text,
}) =>
    Text(
      text,
      style: TextStyle(fontSize: 18, color: Colors.grey),
    );

Widget blue_title_text({
  required String text,
}) =>
    Text(
      text,
      style: TextStyle(
          fontSize: 26,
          color: Constants.primary_blue_color,
          fontWeight: FontWeight.bold,
          fontFamily: 'custom_font'),
    );
