import 'package:flutter/material.dart';

import '../../../constants.dart';

class AuthCustomTextFormFieldPassword extends StatelessWidget {
  const AuthCustomTextFormFieldPassword({
    Key? key,
    required this.hint,
    required this.controller,
    required this.iconData,
  });

  final hint;
  final controller;
  final iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '$hint required';
        }
        return null;
      },
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Constants.primary_blue_color,
      style: TextStyle(
          color: Constants.primary_blue_color
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color:  Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          iconData,
          color: Constants.primary_yellow_color,
        ),
        hintStyle: TextStyle(
            color: Constants.primary_blue_color
        ),
        hintText: hint,
      ),
    );
  }
}
