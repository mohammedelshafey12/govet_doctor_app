import 'package:flutter/material.dart';

import '../../constants.dart';

class AuthCustomTextFormFieldText extends StatelessWidget {
  const AuthCustomTextFormFieldText({
    Key? key,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    required this.iconData,
  });

  final hint;
  final controller;
  final iconData;
  final keyboardType;

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
      keyboardType: keyboardType,
      cursorColor: Constants.primary_blue_color,
      style: TextStyle(color: Constants.primary_blue_color),
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
            color: Colors.white,
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
        hintStyle: TextStyle(color: Constants.primary_blue_color),
        prefixIcon: Icon(
          iconData,
          color: Constants.primary_yellow_color,
        ),
        hintText: hint,
      ),
    );
  }
}
