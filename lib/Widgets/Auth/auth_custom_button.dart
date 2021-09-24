import 'package:flutter/material.dart';

import '../../../constants.dart';


class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({
    Key? key,
    required this.onTap,
    required this.title,
  });

  final onTap;
  final title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      minWidth: width,
      onPressed: () {
        onTap();
      },
      elevation: 0.0,
      color: Constants.primary_yellow_color,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
