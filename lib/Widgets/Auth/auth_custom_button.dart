import 'package:flutter/material.dart';

import '../../constants.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
  });

  final onPressed;
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Builder(
        builder: (context) => FlatButton(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.white, //Color of the border
              style: BorderStyle.solid, //Style of the border
              width: 1.5, //width of the border
            ),
          ),
          onPressed: onPressed,
          color: Constants.primary_yellow_color,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'custom_font',
            ),
          ),
        ),
      ),
    );
  }
}
