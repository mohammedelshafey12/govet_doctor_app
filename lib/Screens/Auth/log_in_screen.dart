import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govet_doctor_app/Provider/model_hud.dart';
import 'package:govet_doctor_app/Screens/Auth/sign_up_screen.dart';
import 'package:govet_doctor_app/Services/auth.dart';
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
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        backgroundColor: Constants.primary_blue_color,
        appBar: AppBar(
          title: Text(
            'Log In',
          ),
        ),
        body: Form(
          key: _globalKey,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: height,
              width: width,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: Container(
                      width: width * 0.2,
                      child: Image.asset(
                        Constants.logInLogo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //text
                  //custom text field for username
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Constants.primary_yellow_color,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Constants.primary_yellow_color)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Constants.primary_yellow_color)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Constants.primary_yellow_color)),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Constants.primary_yellow_color,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(fontFamily: 'custom_font')),
                    ),
                  ),
                  //custom text for password
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Constants.primary_yellow_color,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Constants.primary_yellow_color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Constants.primary_yellow_color,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Constants.primary_yellow_color,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Constants.primary_yellow_color,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'custom_font',
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  //login button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Builder(
                      builder: (context) => FlatButton(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 1.5, //width of the border
                          ),
                        ),
                        onPressed: () async {
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
                        color: Constants.primary_yellow_color,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'custom_font'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Don't Have An Account?",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'custom_font'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: SignUpScreen(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'custom_font',
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
