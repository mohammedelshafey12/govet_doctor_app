import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govet_doctor_app/Provider/model_hud.dart';
import 'package:govet_doctor_app/Screens/Auth/sign_up_screen.dart';
import 'package:govet_doctor_app/Services/auth.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_button.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_header.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_text_form_field.dart';
import 'package:govet_doctor_app/Widgets/Auth/auth_custom_text_form_field_password.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading1,
      child: Scaffold(
        backgroundColor: Constants.primary_blue_color,
        appBar: AppBar(
          title: Text(
            'Log In',
          ),
        ),
        body: Form(
          key: _globalKey,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              AuthCustomHeader(
                width: width,
              ),
              AuthCustomTextFormFieldText(
                iconData: Icons.email,
                hint: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.02),
              AuthCustomTextFormFieldPassword(
                hint: 'Password',
                controller: passwordController,
                iconData: Icons.lock,
              ),
              SizedBox(height: height * 0.02),
              AuthCustomButton(
                title: 'Login',
                onTap: () async {
                  final modelHud =
                      Provider.of<ModelHud>(context, listen: false);
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    modelHud.isProgressLoading(true);
                    try {
                      final authResult =
                          await _auth.signInWithEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        context,
                      );

                      modelHud.isProgressLoading(false);
                    } on PlatformException catch (e) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          e.message.toString(),
                          style: TextStyle(fontFamily: 'font'),
                        ),
                      ));
                      modelHud.isProgressLoading(false);
                    }
                  }
                },
              ),
              SizedBox(height: height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Don't Have An Account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: SignUpScreen(),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Constants.primary_yellow_color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
