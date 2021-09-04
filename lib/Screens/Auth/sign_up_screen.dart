import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govet_doctor_app/Models/doctor_model.dart';
import 'package:govet_doctor_app/Provider/model_hud.dart';
import 'package:govet_doctor_app/Services/auth.dart';
import 'package:govet_doctor_app/Services/store.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_button.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_header.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = Auth();
  final _store = Store();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorAgeController = TextEditingController();
  TextEditingController doctorPhoneController = TextEditingController();
  TextEditingController doctorEmailController = TextEditingController();
  TextEditingController doctorAddressController = TextEditingController();
  TextEditingController doctorPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        backgroundColor: Constants.primary_blue_color,
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Form(
          key: _globalKey,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: height,
              width: width,
              child: ListView(
                children: [
                  AuthCustomHeader(
                    width: width,
                  ),
                  AuthCustomTextFormField(
                    hint: 'Name',
                    controller: doctorNameController,
                    keyboardType: TextInputType.text,
                    icon: Icons.person,
                  ),
                  AuthCustomTextFormField(
                    hint: 'Age',
                    controller: doctorAgeController,
                    keyboardType: TextInputType.number,
                    icon: Icons.cake,
                  ),
                  AuthCustomTextFormField(
                    hint: 'Email',
                    controller: doctorEmailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                  ),
                  AuthCustomTextFormField(
                    hint: 'Phone',
                    controller: doctorPhoneController,
                    keyboardType: TextInputType.number,
                    icon: Icons.phone,
                  ),
                  AuthCustomTextFormField(
                    hint: 'Address',
                    controller: doctorAddressController,
                    keyboardType: TextInputType.text,
                    icon: Icons.location_on,
                  ),
                  AuthCustomTextFormField(
                    hint: 'Password',
                    controller: doctorPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  AuthCustomButton(
                    title: 'Sign Up',
                    onPressed: () async {
                      final modelHud = Provider.of<ModelHud>(
                        context,
                        listen: false,
                      );
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        modelHud.isProgressLoading(true);
                        try {
                          final authResult =
                              await _auth.signUpWithEmailAndPassword(
                            doctorEmailController.text,
                            doctorPasswordController.text,
                            context,
                          );
                          User? userAuth =
                              FirebaseAuth.instance.currentUser;
                          modelHud.isProgressLoading(false);
                          _store.addDoctor(
                            Doctor(
                              doctorId: userAuth!.uid,
                              doctorName: doctorNameController.text,
                              doctorAge: doctorAgeController.text,
                              doctorEmail: doctorEmailController.text,
                              doctorPhone: doctorPhoneController.text,
                              doctorAddress: doctorAddressController.text,
                              doctorImageUrl: null,
                            ),
                          );
                        } on PlatformException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              e.message.toString(),
                              style: TextStyle(fontFamily: 'custom_font'),
                            ),
                          ));
                          modelHud.isProgressLoading(false);
                        }
                        modelHud.isProgressLoading(false);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
