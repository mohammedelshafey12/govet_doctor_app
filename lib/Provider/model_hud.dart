import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ModelHud extends ChangeNotifier{
  bool isLoading = false;
  late FirebaseAuth user;
  isProgressLoading (bool isLoading) {
    isLoading = isLoading;
    notifyListeners();
  }
}