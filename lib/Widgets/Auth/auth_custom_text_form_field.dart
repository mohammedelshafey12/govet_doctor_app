import 'package:flutter/material.dart';

import '../../constants.dart';

class AuthCustomTextFormField extends StatelessWidget {
  const AuthCustomTextFormField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
  });
  final icon;
  final hint;
  final controller;
  final keyboardType;
  final obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Constants.primary_yellow_color,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Constants.primary_yellow_color,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Constants.primary_yellow_color,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Constants.primary_yellow_color,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'custom_font',
          ),
        ),
        validator: (value){
          if (value!.isEmpty) {
            return '$hint Required';
          }
          return null;
        },
        controller: controller,
        keyboardType: keyboardType,
      ),
    );
  }
}
