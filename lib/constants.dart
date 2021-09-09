import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:page_transition/page_transition.dart';

class Constants {
  static const String agouraId = 'd004bdf5771e439c96f5f558b7aae997';
  // double width = MediaQuery.of(context).size.width;
  // double height = MediaQuery.of(context).size.height;
  ///firebase Collections
  static const String userCollection = 'Users';
  static const String doctorCollection = 'DoctorCollection';
  static const String petCollection = 'Pets';
  static const String homeVisitCollection = 'HomeVisitCollection';

  /// Firebase Constants user collection
  static const String userName = 'UserName';
  static const String userPhone = 'UserPhone';
  static const String userId = 'UserId';
  static const String userAge = 'UserAge';
  static const String userImageUrl = 'UserImageUrl';
  static const String userOsId = 'UserOsId';
  /// Firebase Constants Home Visit Date collection
  static const String homeVisitDate = 'HomeVisitDate';
  static const String homeVisitAddress = 'HomeVisitAddress';
  static const String homeVisitReason = 'HomeVisitReason';
  static const String homeVisitDoctorId = 'HomeVisitDoctorId';
  static const String homeVisitDoctorName = 'HomeVisitDoctorName';
  static const String homeVisitDoctorPhone = 'HomeVisitDoctorPhone';
  static const String homeVisitVerify = 'HomeVisitVerify';

  /// Firebase Constants Pet collection
  static const String petId = 'PetId';
  static const String petName = 'PetName';
  static const String petBreed = 'PetBreed';
  static const String petGender = 'PetGender';
  static const String petUrlImage = 'PetUrlImage';
  static const String petAge = 'PetAge';
  static const String petWeight = 'PetWeight';
  static const String petHeight = 'PetHeight';
  static const String petAdditionalNote = 'PetAdditionalNote';

  /// Firebase Constants Home Visit Date collection
  static const String doctorId = 'DoctorId';
  static const String doctorName = 'DoctorName';
  static const String doctorAge = 'DoctorAge';
  static const String doctorPhone = 'DoctorPhone';
  static const String doctorEmail = 'DoctorEmail';
  static const String doctorAddress = 'DoctorAddress';
  static const String doctorImageUrl = 'DoctorImageUrl';
  static const String doctorIsVerify = 'DoctorIsVerify';

  /// constants app colors
  static const Color primary_blue_color = Color(0xfff25265E);
  static const Color primary_yellow_color = Color(0xfffF79B23);
  static const Color home_background_color = Color(0xfffF6F8FC);

  /// constants images
  static const String splash_logo = 'images/splash_logo.png';
  static const String logInLogo= 'images/log_in_logo.png';
  static const String signUpLogo= 'images/log_in_logo.png';
  static const String doctorwithdog = 'images/doctorwithdog.png';
  static const String pawprintSolid = 'images/pawprintSolid.png';
  static const String person = 'images/person.png';

  /// method navigate page
  static void navigatorPush({context, screen}) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: screen,
      ),
    );
  }
  /// method navigate and remove page
  static void navigatorPushAndRemove({context, screen}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: screen,
      ),
          (route) => false,
    );
  }

}
