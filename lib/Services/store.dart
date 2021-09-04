import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:govet_doctor_app/Models/doctor_model.dart';

import '../constants.dart';

class Store {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// After Sign in Update User Information In Firebase Firestore
  addDoctor(Doctor doctor) {
    fireStore.collection(Constants.doctorCollection).doc(doctor.doctorId).set({
      Constants.doctorId: doctor.doctorId,
      Constants.doctorName: doctor.doctorName,
      Constants.doctorAge: doctor.doctorAge,
      Constants.doctorEmail: doctor.doctorEmail,
      Constants.doctorPhone: doctor.doctorPhone,
      Constants.doctorAddress: doctor.doctorAddress,
      Constants.doctorImageUrl: doctor.doctorImageUrl,
    });
  }


}