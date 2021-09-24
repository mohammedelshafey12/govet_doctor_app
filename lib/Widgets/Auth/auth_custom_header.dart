import 'package:flutter/material.dart';

import '../../constants.dart';

class AuthCustomHeader extends StatelessWidget {
  const AuthCustomHeader({Key? key, required this.width,});
  final width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: Container(
        // width: width * 0.2,
        child: Image.asset(
          Constants.logInLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
