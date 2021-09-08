import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Screens/Home_Screen/home_screen.dart';
import 'package:govet_doctor_app/Screens/Home_Screen/waiting_verify.dart';
import 'package:govet_doctor_app/constants.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future signUpWithEmailAndPassword(String email,
      String password,
      context,) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Constants.navigatorPush(
          context: context,
          screen: WaitingVerify(),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.message.toString(),
          style: TextStyle(fontFamily: 'custom_font'),
        ),
      ));
      print(e.message);
      if (e.code == 'weak-password') {
        print(e.message);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Sign In Method
  Future<void> signInWithEmailAndPassword(
      String email, String password,context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Constants.navigatorPush(
          context: context,
          screen: WaitingVerify(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.message.toString(),
          style: TextStyle(fontFamily: 'custom_font'),
        ),
      ));
      print(e.message);
      if (e.code == 'weak-password') {
        print(e.message);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
